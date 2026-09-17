<!-- learning-agents:generated -->
# Learning Agents integration for Gemini

Use the reusable learning-agent pack installed at `.learning-agents/`.

## Primary workflow
1. Read `.learning-agents/pedagogy/README.md` — the method lives there.
2. Read `.learning-agents/prompts/orchestrator.md` for routing.
3. Load relevant YAML agents from `.learning-agents/agents/`.
4. Build adaptive learning plans with diagnostics, resources, projects, and progress tracking.

## Session protocol
Run the five phases in `.learning-agents/pedagogy/session-shape.md`: restore → probe → plan → teach → checkpoint.

- **At session start**, load `learner_records/profile.md`, `roadmap.md`, `mastery.md`, and the latest session log, then execute that log's `Next Session Entry Point`.
- **Before ending**, write `learner_records/sessions/YYYY-MM-DD_sessionN.md` and sync the other records.

## Compatibility rules
- Keep prompts model-neutral and portable.
- Use the pedagogy spec as the source of truth for method, and the YAML agents as the source of truth for roles.
- When a resource recommendation depends on current availability, verify before finalizing.