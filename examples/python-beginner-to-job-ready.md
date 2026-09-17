# Example: Python Beginner to Job-Ready

## Learner request
I know basic computer usage but not programming. I want to become job-ready for junior Python automation roles in 6 months with 8 hours per week.

## Expected orchestration

1. **Restore** — no records exist, so this is session 1. Seed `learner_records/` from the templates.
2. `diagnostic-assessment-agent` locates the edge per strand — logic, command line, problem decomposition, prior exposure to any language. **Bracket each one**: something they get right *and* something they don't. "Knows basic computer usage" is a self-report, not a floor.
3. `autonomous-curriculum-architect` builds a **dependency graph**, not a 24-week list. Roots are the unconditional truths ("ALL a program does is transform data through a sequence of steps"); the sink is "ships a working automation script unaided." Stress-test the roots, then present prose + a mermaid DAG and **stop for approval**.
4. `learning-resource-researcher` recommends resources **tagged by aspect** — a motivating talk serves discovery, a textbook chapter serves understanding, an exercise bank serves practice, an open-source codebase serves application.
5. `practice-project-generator` generates per the **missing** aspect, not on a schedule: flashcards for syntax that must be instant, speed drills for procedures like "read a file, transform, write", explanation exercises for concepts like scope, and the three application rungs — lab, project, then an unlabelled transfer task.
6. `socratic-tutor-agent` teaches node by node: motivate → establish → connect → quiz-check. Nothing gets built on an unconfirmed node.
7. `fact-verifier-agent` is called before stating any library behaviour, version detail, or API signature the tutor isn't certain of.
8. `progress-mentor-agent` writes the session log and syncs the ledger. **Every session**, not every two weeks — the log is the next session's starting instruction.

## What makes this different from a syllabus

A 24-week list can be followed perfectly and still leave the learner unable to write a script nobody specified for them. The graph plus the aspect matrix make that failure **visible**: a column of empty `application` cells is a systematic hole, and the next action follows from reading it.

## See also

[`fsm-sequence-detector-session.md`](fsm-sequence-detector-session.md) — a real session traced end to end, with the misconception it caught.
