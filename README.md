# Learning Agents

This repository contains model-agnostic AI learning-system agents that can collect resources, analyze learner needs, teach, test mastery, and adapt a curriculum for any topic.

## Agent set

| Agent | Purpose |
| --- | --- |
| Autonomous Curriculum Architect | Designs the complete adaptive curriculum, module sequence, schedule, and mastery plan. |
| Diagnostic Assessment Agent | Measures current level and prerequisite gaps before planning. |
| Learning Resource Researcher | Finds and ranks high-quality learning materials for each module. |
| Socratic Tutor Agent | Teaches interactively through guided questions, hints, feedback, and recaps. |
| Practice Project Generator | Creates drills, labs, portfolio projects, acceptance criteria, and stretch goals. |
| Progress Mentor Agent | Tracks evidence of progress, detects bottlenecks, and adjusts the plan. |

All agent definitions are stored in [`agents/`](agents/) as YAML files.

## Gemini and Google Antigravity compatibility

This repo includes:

- `GEMINI.md` for Gemini CLI and Google Antigravity workspace context.
- `.gemini/settings.json` to use `GEMINI.md` as the Gemini context file.
- `.antigravity/workflows/autonomous-curriculum-architect.md` as an Antigravity-friendly workflow.
- `prompts/orchestrator.md` for cross-model routing between the specialist agents.

## How to use

1. Start with `prompts/orchestrator.md`.
2. Provide a learner request, including topic, goal, current level, and time budget.
3. Load the relevant YAML files from `agents/`.
4. Produce the curriculum, diagnostics, resources, practice tasks, and tracking plan.

## Example

See `examples/python-beginner-to-job-ready.md` for an example orchestration flow.
