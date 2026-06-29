# Learning Agents Repository Instructions

This repository stores model-agnostic learning-agent definitions for an autonomous curriculum-building system.

## Compatibility
- Agent definitions live in `agents/*.yaml` and are designed to be readable by Gemini, Google Antigravity, and OpenAI-compatible orchestrators.
- Keep prompts model-neutral. Do not depend on provider-specific tool names unless the integration file documents a fallback.
- Validate each agent against `schemas/agent.schema.json` when adding automation.

## Editing guidelines
- Prefer clear YAML fields: `id`, `name`, `version`, `model_compatibility`, `purpose`, `inputs`, `outputs`, `system_prompt`, `workflow`, and `quality_rules`.
- Keep each agent focused on one responsibility.
- Add examples for new orchestration flows in `examples/`.
