<!-- learning-agents:generated -->
# Learning Agents integration for OpenAI-compatible coding agents

Use the reusable learning-agent pack installed at `.learning-agents/`.

## How to operate
1. Read `.learning-agents/pedagogy/README.md` and `.learning-agents/pedagogy/teaching-method.md` first. The method lives there; the agents are bindings of it.
2. Read `.learning-agents/prompts/orchestrator.md` for routing.
3. Load agent definitions from `.learning-agents/agents/*.yaml` as needed.
4. For learning-plan requests, start with `autonomous-curriculum-architect`.
5. Use `diagnostic-assessment-agent` when the learner's level is unclear — do not guess a level.
6. Use `learning-resource-researcher`, `practice-project-generator`, `socratic-tutor-agent`, `fact-verifier-agent`, and `progress-mentor-agent` for specialist tasks.

## Session protocol
Every session runs the five phases in `.learning-agents/pedagogy/session-shape.md`:
**restore → probe → plan → teach → checkpoint.**

- **At session start** you MUST load `learner_records/profile.md`, `roadmap.md`, `mastery.md`, and the most recent session log, then execute that log's `Next Session Entry Point`.
- **Before ending** you MUST write `learner_records/sessions/YYYY-MM-DD_sessionN.md` and sync `mastery.md`, `deck.md`, `roadmap.md`, and `profile.md`.

A session that is not written down did not fully happen — the checkpoint is the input to the next session's restore.

## Output expectation
Return a learner profile, diagnostic or gap analysis, curriculum map as a dependency graph, module plan, resource recommendations, practice artifacts, progress rules, and the learner's immediate next action.