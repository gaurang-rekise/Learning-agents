# Antigravity Workflow: Autonomous Curriculum Architect

> This workflow implements `prompts/orchestrator.md`. Where the two appear to
> differ, the orchestrator is authoritative — in particular its restore and
> checkpoint phases, which are mandatory here too.

## When to use
Use this workflow when a learner asks to master a topic, build a study plan, collect resources, test their knowledge, or create practice projects.

## Read first
- `pedagogy/README.md`, then `pedagogy/teaching-method.md` — the method
- `prompts/orchestrator.md` — routing and the session lifecycle

## Persistent state — not optional

Learner state lives in `learner_records/` and is the reason this system is a course rather than a series of unrelated lessons.

- **Restore before anything else:** load `profile.md`, `roadmap.md`, `mastery.md`, and the most recent session log. Execute that log's `Next Session Entry Point`. Re-test any misconception that has come due.
- **Checkpoint before finishing:** write `sessions/YYYY-MM-DD_sessionN.md` and synchronise `mastery.md`, `deck.md`, `roadmap.md`, and `profile.md` via `agents/progress-mentor-agent.yaml`.

## Inputs to collect
- Topic
- Target outcome
- Current level
- Deadline or time horizon
- Weekly time budget
- Preferred learning formats
- Constraints

## Steps
1. Read `GEMINI.md` for repository context and `pedagogy/README.md` for the method.
2. **Restore** learner state from `learner_records/`.
3. If the level on any relevant strand is uncertain or stale, load `agents/diagnostic-assessment-agent.yaml` and locate the edge — bracketed on both sides. Do not guess a level.
4. Load `agents/autonomous-curriculum-architect.yaml` as the lead agent. Plan as a dependency graph, not a flat module list; stress-test the roots.
5. Present the plan as prose plus a mermaid DAG, then **stop for learner approval.**
6. Load `agents/learning-resource-researcher.yaml` for resource selection, tagging each resource with the learning aspect it serves.
7. Load `agents/practice-project-generator.yaml` for the format the missing aspect calls for — flashcards, drills, explanation exercises, labs, or transfer tasks.
8. Use `agents/socratic-tutor-agent.yaml` for interactive teaching, one node at a time.
9. Use `agents/fact-verifier-agent.yaml` before stating anything you are less than certain of.
10. Use `agents/progress-mentor-agent.yaml` for tracking, adaptation rules, and all writes to the archive.
11. **Checkpoint.**

## Deliverables
- Curriculum map as a dependency graph
- Weekly learning plan
- Diagnostics, rubrics, and the located edge per strand
- Resources tagged by aspect
- Practice artifacts and acceptance criteria
- Progress review cadence
- A written session log ending in an executable Next Session Entry Point
