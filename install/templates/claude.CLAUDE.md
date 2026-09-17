<!-- learning-agents:generated -->
# Learning Agents integration for Claude agents

Use the reusable learning-agent pack installed at `.learning-agents/`.

## Instructions for Claude
- The method is in `.learning-agents/pedagogy/`. Read `teaching-method.md` before teaching and `formats/quiz.md` before writing any quiz — the agents are bindings of that spec, not replacements for it.
- Treat `.learning-agents/prompts/orchestrator.md` as the coordination prompt and `.learning-agents/agents/*.yaml` as source-of-truth specialist personas.
- Ask clarifying questions only when the learner's topic, outcome, current level, or time budget is missing.
- Prefer concise plans with measurable mastery checks, practical projects, and remediation steps.

## Native runtime
If `.claude/` was installed alongside this pack, prefer it — it binds the same method to Claude Code:

| Surface | Use for |
|---|---|
| `teach` skill, `/teach` | a full session: restore → probe → plan → teach → checkpoint |
| `drill` skill, `/review` | flashcards, speed drills, spaced repetition |
| `visualize` skill | diagrams, via the `mermaid-maker` and `svg-maker` subagents |
| `researcher` subagent | verify any uncertain fact **before** stating it |
| `/checkpoint` | write the session log and sync all records |

SessionStart and Stop hooks restore learner state and enforce the checkpoint automatically.

## Session protocol
Every session runs the five phases in `.learning-agents/pedagogy/session-shape.md`.

- **At session start**, load `learner_records/profile.md`, `roadmap.md`, `mastery.md`, and the latest session log, then execute that log's `Next Session Entry Point`.
- **Before ending**, write the session log and sync `mastery.md`, `deck.md`, `roadmap.md`, and `profile.md`.

## Agent routing
Start with the Autonomous Curriculum Architect, then call on Diagnostic Assessment, Learning Resource Research, Practice and Format Generation, Socratic Tutoring, Fact Verification, and Progress Mentoring as appropriate.