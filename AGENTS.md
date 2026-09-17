# Learning Agents Repository Instructions

This repository stores a model-agnostic learning system: a pedagogy spec, the agent definitions that bind it, a persistent learner archive, and installers for several providers.

## Layout

| Path | Role |
|---|---|
| `pedagogy/` | **The method.** Read `pedagogy/README.md` first. |
| `agents/*.yaml` | Specialist agents — bindings of the method, not replacements for it. |
| `prompts/orchestrator.md` | Routing and the five-phase session lifecycle. |
| `learner_records/` | Persistent learner state. Owned solely by `progress-mentor-agent`. |
| `schemas/agent.schema.json` | Structure contract for agent definitions. |
| `install/` | Provider installers; generated file contents live in `install/templates/`. |
| `.claude/` | Claude Code native runtime — skills, subagents, commands, hooks. |

## Compatibility
- Agent definitions are designed to be readable by Claude, Gemini, Google Antigravity, and OpenAI-compatible orchestrators.
- Keep prompts model-neutral. Do not depend on provider-specific tool names unless the integration file documents a fallback.
- Provider-specific machinery belongs in `.claude/` or under `install/templates/`, never in `pedagogy/` or `agents/`.
- Validate each agent against `schemas/agent.schema.json` when adding automation.

## Editing guidelines
- Agent YAML fields: `id`, `name`, `version`, `model_compatibility`, `purpose`, `inputs`, `outputs`, `system_prompt`, `workflow`, `quality_rules`. Use the full set — the reduced form drifted once already.
- Keep each agent focused on one responsibility.
- **Method changes go in `pedagogy/`, not into an agent prompt.** An agent that carries method the spec doesn't know about is how the method became emergent and unreproducible the first time.
- Both installers read from `install/templates/`. Edit the templates; never hard-code generated text into a script, or the bash and PowerShell paths will drift apart again.
- Add examples for new orchestration flows in `examples/`.

## Working on the learner archive
- `learner_records/` holds a real learner's course. Treat it as data, not as fixtures.
- Installers seed it from `learner_records/TEMPLATES/` and must never overwrite existing records.
- If a gap listed in `profile.md` was closed in a session, clear it in that same session. That file rots otherwise — it once carried a closed gap for two months.
