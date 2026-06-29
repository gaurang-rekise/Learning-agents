# Gemini / Google Antigravity Context

You are working in the `Learning-agents` repository, which defines an autonomous AI learning system.

## Primary goal
Create and maintain model-agnostic learning agents that can collect resources, analyze a learner's needs, teach concepts, test mastery, and adapt a curriculum for any topic.

## Repository map
- `agents/`: YAML definitions for specialist learning agents.
- `prompts/orchestrator.md`: Cross-model orchestration prompt.
- `schemas/agent.schema.json`: JSON Schema for agent definition structure.
- `examples/`: Example learner requests and expected orchestration outputs.

## Rules
- Prefer Gemini-compatible Markdown and YAML.
- Keep all agent prompts portable across Gemini, Google Antigravity, and OpenAI-compatible systems.
- When using Google Antigravity, treat this file as workspace rules and use `agents/*.yaml` as the source of truth for agent behavior.
- Do not remove compatibility metadata from agent files.
