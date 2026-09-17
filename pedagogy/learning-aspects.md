# The Four Learning Aspects

## The problem this solves

"Learned it" is not one thing, and treating it as one thing is why progress tracking rots.

The roadmap in this repo has sixteen module checkboxes. Not one has ever been ticked — including Module 2, whose central concept the learner demonstrably mastered on 2026-07-07, deriving the complete overlapping `1-0-1` detector FSM from scratch including state minimisation. The checkbox stayed empty because a single binary box has no honest value for "understands it completely on paper, has never built one."

A binary checkbox forces that lie. Four aspects don't.

## The four aspects

Every node — every concept, every technique — can be held in four different ways. They are genuinely independent: you can have any one without the others.

| Aspect | The question it answers | What it feels like to lack it |
|---|---|---|
| **Discovery** | *Why does this exist?* | "I can use it but I don't know what it's for." |
| **Understanding** | *How does it hang together?* | "I know the steps but not why they work." |
| **Practice** | *Can I do it reliably and fast?* | "I get it, but I'm slow and I make slips." |
| **Application** | *When does it matter?* | "I can do the exercise but not the real problem." |

### Discovery — awareness

The learner knows the problem this node solves, and why someone went looking for it in the first place. Without this, everything downstream feels arbitrary — which, per Principle ii, means it will not lock in.

- **Activity:** curiosity-gap opener, motivating problem, history of the idea, the failure that made it necessary.
- **Evidence of mastery:** can state the problem it solves, unprompted, in their own words.

### Understanding — mental model

The learner can re-derive the node from foundations they already hold. This is the aspect `teaching-method.md` is almost entirely about.

- **Activity:** Socratic derivation, explicit DAG placement, diagram, Feynman explanation.
- **Evidence of mastery:** can re-derive it from foundations, and can explain it to a naive listener without leaning on jargon.

### Practice — mastery, speed

The learner can execute reliably, quickly, without conscious effort. Understanding does not produce this; only repetition does. A learner who must re-derive a truth table every time has understanding but not practice, and will bottleneck on it forever.

- **Activity:** flashcards for the facts, speed drills for the procedures, spaced repetition for retention.
- **Evidence of mastery:** correct under time pressure, on a later day, without a warm-up.

### Application — perspective, experience

The learner recognises the situation that calls for this node, in a context where nobody told them which tool to reach for. This is the aspect that separates coursework from competence.

- **Activity:** labs, projects, transfer tasks, deliberately unlabelled problems, cross-domain connection.
- **Evidence of mastery:** reached for it unprompted in a novel setting.

---

## The rule

**A node is not mastered until it carries evidence in all four aspects.**

This replaces the binary checkbox. Track per node, per aspect:

```
- [x] discovery      2026-07-07  stated the sequence-detection problem unprompted
- [x] understanding  2026-07-07  derived all 8 transitions incl. overlap from scratch
- [ ] practice       —           never built one; no timed recall yet
- [ ] application    —           not yet used outside the posed exercise
```

Half-mastered is now expressible, which means it is now trackable, which means the next action is obvious: this node needs practice and application, not more explanation.

## How aspects drive sequencing

The aspects are not phases and they are not ordered. But they do have dependencies:

```
Discovery ──► Understanding ──► Application
                    │                ▲
                    └──► Practice ───┘
```

- **Discovery gates understanding.** Deriving something the learner sees no need for is how you produce inert knowledge.
- **Understanding gates practice.** Drilling something not yet understood produces exactly the memorized-and-rotting knowledge `teaching-method.md` exists to prevent. *Never drill an unestablished node.*
- **Practice gates application at speed.** You can apply something you're slow at, but painfully, and the cognitive load crowds out the actual problem.

Practice and application can interleave freely once understanding is in place.

## How aspects choose the format

This is the direct link to `formats/`:

| Aspect | Reach for |
|---|---|
| Discovery | the motivating question, a diagram, a story |
| Understanding | quiz, Socratic derivation, explanation exercise, dependency DAG |
| Practice | flashcard, speed drill |
| Application | lab, project, transfer task |

When choosing what to do next with a node, look at which aspect it is missing and pick from that row. This is the whole selection algorithm.

## Working an aspect matrix

Per module, the ledger is a matrix: nodes down the side, aspects across the top. Reading it tells you what to do next without deliberation.

- **A column that is empty across every node** — a systematic hole. The learner has been taught but never drilled, or drilled but never applied. Fix the routine, not the node.
- **A row that is empty across every aspect** — an untouched node. Start it at discovery.
- **A row with understanding but nothing else** — the classic "makes sense in the lecture, useless in the exam" pattern. Send it to practice.
- **A row with practice but no understanding** — memorization. This is the dangerous one, because it *looks* like competence and is the exact failure mode this whole method exists to prevent. Go back to discovery and re-derive.

Record the matrix in `learner_records/mastery.md`.
