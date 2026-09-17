#!/usr/bin/env bash
# SessionStart hook — Phase 0 (Restore) of pedagogy/session-shape.md.
#
# The orchestrator has always said "you MUST load profile.md and roadmap.md at
# session start." Nothing enforced it, so it drifted: profile.md carried a gap
# the learner had already closed for two full sessions. This makes the restore
# automatic instead of aspirational.
#
# Emits a compact digest on stdout, which Claude Code injects as context.
# Silent and successful when there are no learner records.
set -uo pipefail

ROOT="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
RECORDS="$ROOT/learner_records"
[[ -d "$RECORDS" ]] || exit 0

python3 - "$RECORDS" <<'PYEOF'
import os, re, sys, datetime, glob

records = sys.argv[1]
today = datetime.date.today()
out = []

def read(p):
    try:
        with open(p, encoding="utf-8") as f:
            return f.read()
    except OSError:
        return ""

# --- profile: goal + open gaps -------------------------------------------
profile = read(os.path.join(records, "profile.md"))
if profile:
    goal = re.search(r"\*\*Target Outcome:\*\*\s*(.+)", profile)
    if goal:
        out.append(f"**Goal:** {goal.group(1).strip()}")
    # Sub-items are indented under the Gaps bullet; a same-level sibling
    # bullet (e.g. Diagnostic Status) ends the list.
    gaps = re.search(r"\*\*Gaps:?\*\*:?\s*\n((?:[ \t]+[-*].+\n?)+)", profile)
    if gaps:
        items = [re.sub(r"^\s*[-*]\s*", "", l).strip().rstrip(".")
                 for l in gaps.group(1).strip().splitlines() if l.strip()]
        if items:
            out.append("**Open gaps in profile:** " + "; ".join(items))

# --- roadmap: current status ---------------------------------------------
roadmap = read(os.path.join(records, "roadmap.md"))
if roadmap:
    status = re.search(r"^##\s*Current Status:\s*(.+)$", roadmap, re.M)
    if status:
        out.append(f"**Roadmap position:** {status.group(1).strip()}")

# --- latest session: the entry point -------------------------------------
sessions = sorted(glob.glob(os.path.join(records, "sessions", "*.md")))
if sessions:
    latest = sessions[-1]
    body = read(latest)
    name = os.path.basename(latest)
    m = re.search(r"##\s*Next Session Entry Point\s*\n(.+?)(?=\n##\s|\Z)",
                  body, re.S)
    if m:
        entry = m.group(1).strip()
        out.append(f"\n**Entry point from {name} — execute this first:**\n{entry}")
    else:
        out.append(f"\n**Last session:** {name} (no entry point recorded)")

# --- mastery: misconceptions due for re-test -----------------------------
mastery = read(os.path.join(records, "mastery.md"))
if mastery:
    due = []
    for line in mastery.splitlines():
        d = re.search(r"[Rr]e-?test:?\s*(\d{4}-\d{2}-\d{2})", line)
        if not d:
            continue
        try:
            when = datetime.date.fromisoformat(d.group(1))
        except ValueError:
            continue
        if when <= today:
            due.append(line.strip().lstrip("|").strip())
    if due:
        out.append("\n**Misconceptions due for re-test (before new material):**")
        out.extend(f"- {d}" for d in due[:10])

# --- deck: cards due today -----------------------------------------------
deck = read(os.path.join(records, "deck.md"))
if deck:
    n_due = 0
    for card in re.split(r"(?=^###\s*card-id:)", deck, flags=re.M):
        d = re.search(r"\*\*Due:\*\*\s*(\d{4}-\d{2}-\d{2})", card)
        if d:
            try:
                if datetime.date.fromisoformat(d.group(1)) <= today:
                    n_due += 1
            except ValueError:
                pass
    if n_due:
        out.append(f"\n**{n_due} flashcard(s) due today** — review at session "
                   f"start, before new material (`drill` skill).")

if out:
    print("## Learner state restored\n")
    print("\n".join(out))
    print("\n*Full records in `learner_records/`. Method in `pedagogy/`. "
          "Run the `teach` skill for a session.*")
PYEOF
exit 0
