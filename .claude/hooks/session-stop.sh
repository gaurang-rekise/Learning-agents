#!/usr/bin/env bash
# Stop hook — Phase 4 (Checkpoint) of pedagogy/session-shape.md.
#
# "A session that isn't written down didn't fully happen." The checkpoint is the
# input to the next session's restore, so an unarchived session doesn't just
# lose notes — it breaks the continuity the whole course depends on.
#
# Two gates, both needed. An earlier version used "any file under
# learner_records/ was modified today" as the trigger, which was far too broad:
# editing the records for any reason — a migration, a typo fix — tripped it, and
# because stop_hook_active only guards within a single stop event, it then nagged
# on every turn for the rest of the day.
#
#   Gate 1: the transcript must show a teaching surface was actually used.
#   Gate 2: nag at most once per session, tracked outside the repo.
set -uo pipefail

ROOT="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
INPUT="$(cat)"

python3 - "$ROOT" "$INPUT" <<'PYEOF'
import json, os, re, sys, datetime, glob, hashlib, tempfile

root, raw = sys.argv[1], sys.argv[2]

try:
    payload = json.loads(raw)
except (ValueError, TypeError):
    payload = {}

# Never block twice inside one stop event.
if payload.get("stop_hook_active"):
    sys.exit(0)

records = os.path.join(root, "learner_records")
if not os.path.isdir(records):
    sys.exit(0)

today = datetime.date.today().isoformat()

# Only dated logs count as sessions; the seeded _TEMPLATE.md is not one.
DATED = "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]_*.md"

# Already archived? Nothing to ask for.
if glob.glob(os.path.join(records, "sessions", f"{today}_*.md")):
    sys.exit(0)

# --- Gate 1: did teaching actually happen? -------------------------------
# Only a teaching surface being INVOKED counts. Three things deliberately do not:
#   - editing learner records (a migration is not a lesson)
#   - AskUserQuestion on its own (it is ordinary clarification)
#   - any mention of a skill in prose or in a shell command
#
# The transcript is parsed as JSON and only the structural positions are read --
# a Skill tool_use block, or a slash command in a user message. Scanning the raw
# text instead is how this hook first misfired: a session that AUTHORS the
# teaching system is full of the marker strings without ever teaching anything.
TEACH_SKILLS = {"teach", "drill"}
SLASH = re.compile(r"<command-name>\s*/(teach|review|checkpoint)\s*</command-name>")


def _walk(node):
    """Yield every dict nested anywhere in the decoded entry."""
    if isinstance(node, dict):
        yield node
        for v in node.values():
            yield from _walk(v)
    elif isinstance(node, list):
        for v in node:
            yield from _walk(v)


def _text_parts(entry):
    """Text the user actually typed -- not tool inputs, not tool results."""
    if entry.get("type") != "user":
        return
    content = (entry.get("message") or {}).get("content", entry.get("content"))
    if isinstance(content, str):
        yield content
    elif isinstance(content, list):
        for part in content:
            if isinstance(part, dict) and part.get("type") == "text":
                yield part.get("text") or ""


def entry_shows_teaching(entry):
    for node in _walk(entry):
        if node.get("type") == "tool_use" and node.get("name") == "Skill":
            if (node.get("input") or {}).get("skill") in TEACH_SKILLS:
                return True
    return any(SLASH.search(t) for t in _text_parts(entry))


transcript = payload.get("transcript_path") or ""
if not transcript or not os.path.isfile(transcript):
    # No evidence available. Stay quiet rather than nag on a guess.
    sys.exit(0)

taught = False
try:
    with open(transcript, encoding="utf-8", errors="replace") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                entry = json.loads(line)
            except ValueError:
                continue          # not JSON; nothing structural to read
            if entry_shows_teaching(entry):
                taught = True
                break
except OSError:
    sys.exit(0)

if not taught:
    sys.exit(0)

# --- Gate 2: nag at most once per session --------------------------------
# Kept outside the repo so the working tree is never dirtied.
session_id = str(payload.get("session_id") or "unknown")
key = hashlib.sha256(f"{root}\0{session_id}\0{today}".encode()).hexdigest()[:32]
marker_dir = os.path.join(tempfile.gettempdir(), "learning-agents-checkpoint")
marker = os.path.join(marker_dir, key)

try:
    os.makedirs(marker_dir, exist_ok=True)
    # O_EXCL: the first stop event to get here wins; later ones find it exists.
    fd = os.open(marker, os.O_CREAT | os.O_EXCL | os.O_WRONLY, 0o600)
    os.close(fd)
except FileExistsError:
    sys.exit(0)          # already asked this session
except OSError:
    pass                 # cannot persist the marker; ask anyway, once is better

n = len(glob.glob(os.path.join(records, "sessions", DATED))) + 1
print(json.dumps({
    "decision": "block",
    "reason": (
        f"Checkpoint not written. Before finishing, create "
        f"`learner_records/sessions/{today}_session{n}.md` with all seven "
        "sections (Summary, Key Activities, Decisions Made, Misconception "
        "Notes, Calibration, Unresolved Gaps / Homework, Next Session Entry "
        "Point), then update mastery.md, deck.md, roadmap.md, and — if a gap "
        "listed there closed today — profile.md.\n\n"
        "The Next Session Entry Point must be an executable script, not a "
        "topic. If no teaching happened this session, say so briefly and stop."
    ),
}))
PYEOF
exit 0
