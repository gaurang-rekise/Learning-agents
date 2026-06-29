# Antigravity Workflow: Autonomous Curriculum Architect

## When to use
Use this workflow when a learner asks to master a topic, build a study plan, collect resources, test their knowledge, or create practice projects.

## Inputs to collect
- Topic
- Target outcome
- Current level
- Deadline or time horizon
- Weekly time budget
- Preferred learning formats
- Constraints

## Steps
1. Read `GEMINI.md` for repository context.
2. Load `agents/autonomous-curriculum-architect.yaml` as the lead agent.
3. If level is uncertain, load `agents/diagnostic-assessment-agent.yaml` and produce a diagnostic.
4. Load `agents/learning-resource-researcher.yaml` for resource selection.
5. Load `agents/practice-project-generator.yaml` for exercises and capstones.
6. Use `agents/progress-mentor-agent.yaml` to define tracking and adaptation rules.
7. Use `agents/socratic-tutor-agent.yaml` when the learner asks for interactive teaching.

## Deliverables
- Curriculum map
- Weekly learning plan
- Diagnostics and rubrics
- Resources
- Projects and acceptance criteria
- Progress review cadence
