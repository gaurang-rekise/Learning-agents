<!-- learning-agents:generated -->
# Learning Agents workflow for Google Antigravity

## When to use
Use when a learner asks to master a topic, build a study plan, collect resources, test knowledge, or create practice projects.

## Source files
- `.learning-agents/pedagogy/` — the method (read `README.md`, then `teaching-method.md`)
- `.learning-agents/prompts/orchestrator.md`
- `.learning-agents/agents/autonomous-curriculum-architect.yaml`
- `.learning-agents/agents/diagnostic-assessment-agent.yaml`
- `.learning-agents/agents/learning-resource-researcher.yaml`
- `.learning-agents/agents/practice-project-generator.yaml`
- `.learning-agents/agents/progress-mentor-agent.yaml`
- `.learning-agents/agents/socratic-tutor-agent.yaml`
- `.learning-agents/agents/fact-verifier-agent.yaml`
- `.learning-agents/agents/diagram-maker-agent.yaml`
- `.learning-agents/agents/svg-diagram-agent.yaml`

## Persistent state
Learner state lives in `learner_records/` and is **not** part of the installed pack, so it survives reinstalls.

- **Restore first:** load `profile.md`, `roadmap.md`, `mastery.md`, and the latest session log; execute that log's `Next Session Entry Point`.
- **Checkpoint last:** write `sessions/YYYY-MM-DD_sessionN.md` and sync `mastery.md`, `deck.md`, `roadmap.md`, `profile.md`.

## Steps
1. Restore learner state from `learner_records/`.
2. Gather topic, target outcome, current level, deadline, weekly time budget, preferred formats, and constraints.
3. Probe to locate the learner's edge before planning — do not guess a level.
4. Use the Autonomous Curriculum Architect as the lead agent; plan as a dependency graph.
5. Select resources and practice artifacts by which learning aspect each node is missing.
6. Define progress checks and remediation rules.
7. Checkpoint: write the session log and sync all records.
8. Return the learner's immediate next action.