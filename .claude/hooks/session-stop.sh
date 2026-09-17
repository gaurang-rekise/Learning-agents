#!/usr/bin/env bash
# Stop hook — Phase 4 (Checkpoint) of pedagogy/session-shape.md.
#
# "A session that isn't written down didn't fully happen." The checkpoint is the
# input to the next session's restore, so an unarchived session doesn't just
# lose notes — it breaks the continuity the whole course depends on.
#
# Blocks once if a teaching session appears to have happened with no session log
# written today. stop_hook_active guards against looping.
set -uo pipefail

ROOT="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
INPUT="$(cat)"

python3 - "$ROOT" "$INPUT" <<'PYEOF'
import json, os, sys, datetime, glob

root, raw = sys.argv[1], sys.argv[2]

try:
    payload = json.loads(raw)
except (ValueError, TypeError):
    payload = {}

# Never block twice — that would loop.
if payload.get("stop_hook_active"):
    sys.exit(0)

records = os.path.join(root, "learner_records")
if not os.path.isdir(records):
    sys.exit(0)

today = datetime.date.today().isoformat()

# Did this session already get archived?
if glob.glob(os.path.join(records, "sessions", f"{today}_*.md")):
    sys.exit(0)

# Only nag when a session plausibly happened: something under learner_records/
# was modified today. Otherwise this was an unrelated session in the repo.
touched = False
for dirpath, _dirs, files in os.walk(records):
    for fn in files:
        p = os.path.join(dirpath, fn)
        try:
            mtime = datetime.date.fromtimestamp(os.path.getmtime(p)).isoformat()
        except OSError:
            continue
        if mtime == today:
            touched = True
            break
    if touched:
        break

if not touched:
    sys.exit(0)

n = len(glob.glob(os.path.join(records, "sessions", "*.md"))) + 1
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
