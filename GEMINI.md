# Gemini / Google Antigravity Context

You are working in the `Learning-agents` repository, which defines an autonomous AI learning system.

## Primary goal
Create and maintain model-agnostic learning agents that can collect resources, analyze a learner's needs, teach concepts so they lock in, test mastery, and adapt a curriculum for any topic.

## Repository map
- `pedagogy/`: **The method.** Model-agnostic spec — teaching principles, the four learning aspects, difficulty calibration, session shape, and output formats. Read `pedagogy/README.md` first; everything else is a binding of it.
- `agents/`: YAML definitions for specialist learning agents.
- `prompts/orchestrator.md`: Cross-model orchestration prompt and session lifecycle.
- `schemas/agent.schema.json`: JSON Schema for agent definition structure.
- `learner_records/`: **Persistent learner state** — profile, roadmap, per-node mastery ledger, flashcard deck, drills, session logs, resource lists. This is what makes the system a course rather than a series of unrelated lessons.
- `examples/`: Example learner requests and worked orchestration outputs.
- `install/`: Scripts that install this pack into another workspace, for any supported provider.
- `.claude/`: Claude Code native runtime — skills, subagents, commands, hooks. Optional; the pedagogy works without it.

## Session rules
Every session runs the five phases in `pedagogy/session-shape.md`: **restore → probe → plan → teach → checkpoint.**

- **Restore first.** Load `learner_records/profile.md`, `roadmap.md`, `mastery.md`, and the latest session log; execute that log's `Next Session Entry Point`.
- **Checkpoint last.** Write the session log and sync the records. A session that is not written down did not fully happen.

## Rules
- Prefer Gemini-compatible Markdown and YAML.
- Keep all agent prompts portable across Claude, Gemini, Google Antigravity, and OpenAI-compatible systems.
- When using Google Antigravity, treat this file as workspace rules and use `agents/*.yaml` as the source of truth for agent behavior, `pedagogy/` as the source of truth for method.
- Do not remove compatibility metadata from agent files.
- Do not state a fact you are unsure of. Verify it first — a wrong foundation corrupts every node built on it.
