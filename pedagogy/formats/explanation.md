# Format: Explanation Exercise

| | |
|---|---|
| **Serves** | Understanding (the strongest test of it there is) |
| **Surface** | Terminal dialogue, transcribed into the session log |
| **Used by** | Phase 3, after a node is established; Phase 1a as a deep probe |

## Why this format is the real test

A quiz confirms a node landed. **An explanation exercise proves it.**

Recognition is cheap: a learner can pick the right option from a list while holding a model that is subtly wrong, because the list did most of the work. Generation is not cheap. Asked to produce the explanation from nothing, every gap in the dependency graph becomes a place where the sentence won't finish.

This is the Feynman technique, and it is the closest available proxy for the goal in `teaching-method.md` — that the fact be *derivable* rather than stored.

---

## The four variants

### 1. Teach it back
> "Explain how the D flip-flop stores a bit, to someone who understands logic gates but has never seen a flip-flop."

The audience specification is the whole design. It fixes exactly which foundations may be assumed and which must be built — which means the learner must *locate the node in the dependency graph* to answer at all.

### 2. Explain to a novice
> "Now explain it to someone who has never seen a logic gate."

Strips away every piece of jargon that could be hiding a gap. Jargon is compressible only if you know what it compresses; a learner who cannot unpack a term is holding a token, not a concept.

**This is the highest-yield variant**, and the most uncomfortable. Use it on nodes that feel suspiciously solid.

### 3. Why, not what
> "Why does the detector need four states rather than three?"

Targets Principle ii directly — the *edges*, not the nodes. A learner who has memorized the state count cannot answer this; a learner who understands state equivalence answers it in a sentence.

### 4. Predict and justify
> "If I removed the S3 --0--> S2 transition and sent it to S0 instead, what breaks, and on what input?"

The strongest variant for surfacing misconceptions, because it forces the model to be *run*, not recited. A wrong model produces a confidently wrong prediction, which is exactly the surprise beat `calibration-and-affect.md` calls for.

---

## Grading an explanation

It is not right/wrong. Score four things, and name which one failed:

| Dimension | Failure looks like |
|---|---|
| **Correct** | states something false |
| **Grounded** | leans on unexplained jargon, or on the thing being explained |
| **Connected** | states the fact without the edge to what it derives from |
| **Complete** | stops at the interesting part |

**"Connected" is the one that matters most**, and the one most often waved through. An explanation that is correct, grounded, and complete but contains no *because* has demonstrated recall, not understanding.

### The circularity check

The most common failure is a definition that assumes itself:

> *"It's sequential because its output depends on the sequence of inputs."*

True, and empty. Whenever an explanation uses the term it is defining — or a direct synonym — stop and ask for it again without that word. This single move catches more hollow understanding than any quiz.

---

## Running the exercise

1. **Name the audience explicitly.** "Explain it" is not a task; "explain it to someone who knows X but not Y" is.
2. **Let them finish.** Do not correct mid-explanation. The places they stall are the data — interrupting destroys the measurement.
3. **Note where it broke**, not just that it broke. A stall at the *third* sentence localises the missing edge precisely.
4. **Feed the gap back into the loop.** A broken explanation identifies a specific missing node or edge. Teach *that*, then ask again.
5. **Ask again in the same session.** An explanation that succeeds only after being taught the gap is a pass; one never re-attempted is an unclosed loop.

---

## As a probe

In Phase 1a, one explanation exercise can replace several quizzes when the strand is conceptual rather than factual — it maps a whole neighbourhood of the graph at once, and shows you the *shape* of the learner's model, not just its extent.

It is slower and less precisely scoped than a quiz, so use it where the territory is unknown and quizzes where the edge needs pinning.

---

## Logging

Explanations are the richest artifact a session produces. Capture in the session log:

- the prompt, **including the specified audience**
- where the explanation broke, and what was missing there
- the learner's own phrasing of any part they got *right* — this is the best source of flashcard fronts, because self-generated phrasing is recalled better than supplied phrasing

Update `mastery.md`: a clean explanation to a naive audience is strong evidence for `understanding`. A broken one opens a gap against a specific edge, not a vague "needs review."
