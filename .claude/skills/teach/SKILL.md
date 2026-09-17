---
name: teach
description: >
  Teach something so it actually locks in and is understood, not just memorized. Use ANY time you are explaining or teaching a concept — even a quick explanation — and always for a learning session against learner_records/. Runs restore → probe → plan → teach → checkpoint, builds a dependency graph rather than delivering facts, confirms every node with a graded quiz before building on it, and persists everything to learner_records/ so the next session continues rather than restarts. Trigger on "teach me", "explain", "I want to learn", "next session", "continue the course", "what's next", or any request to work through a topic.
---

# Teach

The goal is never "the learner can recite the fact." It is **understanding**: the fact is derivable from foundations they already accept, connected into their mental model, and therefore self-preserving. Memorized facts rot. Understood facts don't.

## Read these first

The method is specified in `pedagogy/`. **Read the relevant file before the phase that uses it** — don't work from this summary alone.

| File | When |
|---|---|
| `pedagogy/teaching-method.md` | before teaching anything |
| `pedagogy/session-shape.md` | the phase order below |
| `pedagogy/calibration-and-affect.md` | probing, and difficulty throughout |
| `pedagogy/learning-aspects.md` | deciding what a node still needs |
| `pedagogy/formats/quiz.md` | **before writing any quiz** |
| `pedagogy/formats/exposition.md` | **before any expository stretch** — the craft of making it land |
| `pedagogy/formats/*.md` | when generating that format |

## The phases

Run all five in order, every time. Scale each phase's **size** to the topic, never its **shape**.

### 0. Restore

Read `learner_records/profile.md`, `roadmap.md`, `mastery.md`, the most recent session log, and `deck.md`.

**Open by executing the previous session's `Next Session Entry Point`.** It was written so this session would know where to start.

Re-test any misconception whose re-test date has arrived — *before* new material. A misconception that is never re-tested was never dislodged; it just stopped being visible.

If a SessionStart hook already injected this state, confirm it rather than re-reading blindly.

### 1. Probe

Two separate unknowns:

- **Current level** → graded quizzes. A mapping job, not a spot-check. Locate the **edge** per strand, bracketed on both sides. Full protocol in `calibration-and-affect.md`.
- **Session goal** → an open question via `AskUserQuestion`. No right answer, so never a quiz.

**Gate:** don't plan until, per strand, you can state both what they have and where it ends.

### 2. Plan

Delegate topic scoping to the `fact-verifier` subagent first, so you aren't planning around a half-remembered version of the subject. If the module needs materials, delegate to `resource-researcher` — that is a different job and a different agent.

Present **two things**, then stop:

1. The approach in prose — what, in what order, why this way.
2. A **dependency DAG** as a mermaid graph: unconditional truths at the roots, the goal as the sink. Small — few nodes, short labels.

**Stress-test every root before presenting.** If a "foundation" actually derives from something simpler the learner would accept at face value, push it down. A wrong root corrupts everything above it.

**Wait for their go-ahead before teaching.**

### 3. Teach

Per node — **motivate → establish → connect → quiz-check**. On a failed check, stop and repair before building anything on top.

**Establish** is Socratic by default. When it is expository instead — the idea can't be reasoned to cold, the prerequisite chain is long, the learner is tired, or they asked you to just tell them — follow `pedagogy/formats/exposition.md`: the problem before the thing, the naive attempt and its failure, then the fix as a response to that failure. Worked examples fade as competence grows; every analogy states where it breaks *in the same breath* it is introduced.

Exposition is the one format with no built-in feedback — the learner said nothing, so you have no evidence. **Always close an expository stretch with a quiz-check**, and if it fails, don't re-explain the same way louder: find the missing prerequisite, broken analogy, or skipped step.

### 4. Checkpoint

Write the session log and update `mastery.md`, `deck.md`, `roadmap.md`, and `profile.md`. See the checkpoint section below — this is not optional.

---

## The quiz protocol

Quizzes are the instrument this whole method runs on. Claude Code has no graded-quiz tool, so run this protocol over `AskUserQuestion`:

**1. Construct** per `pedagogy/formats/quiz.md`. The construction procedure matters more than anything else here:
- Every option is a **bare claim with zero justification**. The #1 tell is the correct option carrying its own "because…" while the distractors are bare.
- Write the correct claim first, then **mutate** it into each distractor — same skeleton, same grain size, same register. Parallelism then falls out by construction instead of being policed.
- Each distractor is a **real misconception**, so *which* wrong answer they pick is diagnostic.
- No asymmetric bolding or length.
- **Test:** reading the set cold, can you tell which is right without knowing the material? Then regenerate — don't patch.

**2. Always include an explicit "I don't know" option**, worded exactly that way, as the last option. Claude Code shuffling isn't available, so vary the correct answer's position yourself across questions.

**3. Grade in your next message**, since feedback can't render inside the popup:

```
✗ Not quite — you picked "S0 — firing consumes the match, so progress resets".

The answer is S2. The 0 arriving at S3 is itself the start of a
potential new 1-0-1. Sending it to S0 discards live progress, and
the detector then misses the second occurrence in 10101.
```

Lead with the verdict, name what they picked, give the correct answer, then the explanation. Keep it tight.

**4. Handle the three outcomes differently:**

| Outcome | Meaning | Response |
|---|---|---|
| correct | node landed | continue; escalate if they're on a run |
| incorrect | wrong model | probe *around* it — slip, isolated gap, or systematic misconception? |
| **I don't know** | genuine gap | **never mark it wrong.** Teach into it. Exclude from the success-rate window. |

**One question per call.** To probe nuance, ask several and adapt each to the last answer — never one giant caveated question.

**Never leak the answer** before it's given: not in the question, the options, the descriptions, or anything you say first.

## Calibration

Hold **70–85%** correct over the last ~8–10 graded items.

- **>90%** → too easy. Escalate **sharply** — jump, don't inch.
- **<60%** → back off a node, re-establish the foundation, engineer a win.
- **Two consecutive misses on one node** → stop advancing and repair. A third failure teaches a belief about their capability, not the material.

**Arc:** open on a curiosity gap (a question the learner's current model answers confidently *wrong* is the strongest opener), hardest material in the middle, **close on a guaranteed win. Never end a session on a miss** — what they carry forward is the last thing that happened, not the average.

## Accuracy

The learner must be able to trust you completely; one confident hallucination poisons that.

**The moment you are even slightly unsure of any fact, name, date, formula, definition, or claim — stop and delegate to the `fact-verifier` subagent before you say it.** Pausing to verify is always acceptable. Accuracy beats flow, every time.

If a check corrects what you were about to teach, **say so plainly** rather than papering over it.

## Delegation

| Need | Subagent |
|---|---|
| verify a claim, scope an unfamiliar field | `fact-verifier` |
| find materials for a module — reading lists, courses, labs | `resource-researcher` |
| a nodes-and-edges diagram | `mermaid-maker` |
| a schematic, K-map, timing or coordinate diagram | `svg-maker` |

The two researchers do different jobs: `fact-verifier` answers a question, `resource-researcher` builds a reading list.

Invoke via the Agent tool. Never hand-author a diagram yourself — correctness depends on the maker's render-and-inspect loop. For flashcards and drills, use the `drill` skill.

## Checkpoint — not optional

**A session that isn't written down didn't fully happen.** This is the input to the next session's Phase 0.

Write `learner_records/sessions/YYYY-MM-DD_sessionN.md` with exactly these sections:

```
## Summary
## Key Activities            (numbered, bold lead-in labels)
## Decisions Made
## Misconception Notes       (caught, resolved, WHEN TO RE-TEST)
## Calibration               (graded items, success rate, edge now, open/close)
## Unresolved Gaps / Homework
## Next Session Entry Point
```

Then update:
- **`mastery.md`** — aspect matrix for every node touched; quiz results with all three outcomes distinct; misconceptions with re-test dates
- **`deck.md`** — new cards for facts established; due dates for cards reviewed
- **`roadmap.md`** — reconcile status against the aspect matrix
- **`profile.md`** — **only when the baseline genuinely changed.** This is the file that rots: if a gap listed there closed this session, clear it *now*.

### The entry point is the deliverable

Write it as an executable script, not a topic.

> **Bad:** "Continue with K-maps."
>
> **Good:** "1. Light active recall: *'Why does S3 --0--> go to S2 and not S0?'* 2. Collect homework: truth table from the transition table. 3. Begin state encoding + K-map simplification."

The first is a note to yourself. The second is an instruction the next session can execute.
