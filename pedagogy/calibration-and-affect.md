# Calibration and Affect

## Why difficulty is a control problem

Learning has an emotional envelope, and it is not a side effect — it is the control signal.

Too much failure is discouraging and the learner disengages. Too little challenge is boring and nothing locks in. Between those is a band where difficulty produces curiosity rather than threat, effort rather than resignation, and satisfaction rather than relief.

The teacher's job is to hold the learner in that band. That requires *measuring* where they are, which requires an instrument. The quiz is the instrument. This file is the controller.

---

## Part 1 — Locating the edge

Before you can hold the learner at the right difficulty, you have to find out where they currently are. That is not a spot-check. It is a mapping job.

The **edge** is the frontier where what the learner reliably knows turns into what they don't. Until you have actually found it, you cannot teach into it.

### The edge is only located when it is bracketed

For each relevant strand you need **both**:

- a **floor** — something at that level they get *right* (proof they know at least this much)
- a **ceiling** — something they get *wrong*, or genuinely don't know (where it runs out)

The edge sits between them. **One side alone tells you almost nothing.**

### The four rules

**All-correct is not "done" — it means the questions were too easy.**
A run of right answers gives you a floor with no ceiling. Do not advance. Escalate — go harder until something finally breaks. If they never miss, you never found the edge.

**Binary-search the edge.**
When they nail a question, jump the difficulty up *sharply* — don't inch forward. When they miss, you have bracketed the edge from above; narrow back in to pin exactly where it sits.

**One wrong answer is not "done" either — and it is not a cue to start teaching.**
A single miss is one coordinate, and you don't yet know its kind:

| Kind | Tell | Response |
|---|---|---|
| **Careless slip** | gets it right immediately on a near-identical item | ignore, move on |
| **Isolated gap** | misses this, but neighbours are solid | teach the one node |
| **Systematic misconception** | misses a *family* of items that share a wrong model | must be *dislodged*, not topped up |

Probe *around* a miss to characterise it before concluding anything. Misconceptions matter most: a confidently-held wrong model cannot be fixed by adding correct information on top of it. It has to be surfaced, contradicted by a case the learner's own model gets wrong, and replaced.

**Map every strand the lesson rests on.**
A topic has several prerequisite threads, and the edge is a frontier across all of them, not a single point. Bound this by relevance to the goal — don't map strands the lesson will never touch.

### The gate

Do not advance to planning until, for each goal-relevant strand, you can state concretely **both what the learner has and where it ends.**

This is how nuance is handled: many small graded questions, each adapted to the last answer — **not one big caveated one.**

---

## Part 2 — Holding the band

Once the edge is located, difficulty becomes a live control loop, running for the rest of the session.

### The target band: 70–85% correct on graded items

| Observed | Meaning | Action |
|---|---|---|
| **> 90%** | too easy; boredom risk; you are below the edge | escalate **sharply** — jump, don't inch |
| **70–85%** | in the band; productive struggle | hold; keep advancing |
| **60–70%** | hard but survivable; watch closely | hold, but engineer a win soon |
| **< 60%** | too hard; discouragement risk; you are above the edge | back off a node, re-establish the foundation, engineer a win |

Measured over a rolling window of roughly the last 8–10 graded items, not over the whole session and not over the last two.

### "I don't know" is a distinct signal

Every quiz carries an explicit "I don't know" option, and it is **never graded as wrong.**

This matters more than it looks. Without it, the learner guesses, and a lucky guess is recorded as knowledge that isn't there — which corrupts the band, which corrupts every difficulty decision downstream. The opt-out is what makes the measurement mean anything.

Treat it as **a genuine knowledge gap to teach into**, not a failed attempt. It excludes the item from the success-rate window entirely: it is information about coverage, not about difficulty.

A *rising* rate of "I don't know" means you have moved past the edge into unmapped territory. Stop and re-probe.

### The frustration budget

**After two consecutive misses on the same node, stop advancing and repair.**

A third failure on the same point does not produce learning; it produces a belief about the learner's own capability, which is far harder to undo than any misconception. Back down a level, re-establish the foundation the node hangs off, and only then come back.

Equally: **if the learner is getting everything right, they are not learning either.** An easy session feels good and teaches nothing. Escalating is not cruelty; it is the job.

---

## Part 3 — The session's emotional arc

Difficulty is not the only thing to shape. *Where* in the session each feeling lands matters.

```
  effort
    ▲
    │            ╭───────────╮
    │         ╭──╯           ╰──╮
    │      ╭──╯                 ╰───╮
    │   ╭──╯                        ╰──╮
    └───┴──────────────────────────────┴────► time
      open            middle            close
    curiosity      hardest work        the win
```

**Open on a curiosity gap.** A question before content, not content before question. The opener's job is to create the itch the session then scratches — Principle ii applied to the session as a whole. The strongest openers are ones where the learner's current model gives a confidently wrong answer.

**Put the hardest material in the middle.** Energy and attention are highest after warm-up and before fatigue. This is where a new unconditional truth or a genuinely difficult derivation belongs.

**Close on a guaranteed win.** End with something the learner will get right — a recap quiz on what was just established, a visible artifact completed, a clean statement of what they can now do that they couldn't ninety minutes ago.

**Never end a session on a miss.** What the learner carries to the next session is the last thing that happened, not the average of what happened. A session that went well throughout and ended on a failure is remembered as a bad session, and the next one starts with resistance. If the clock runs out mid-struggle, drop back and close on something solid — even a small one.

### The emotions, and what produces them

| Emotion | Produced by | Too little | Too much |
|---|---|---|---|
| **Curiosity** | an unanswered question the learner *wants* answered | material feels arbitrary; nothing motivates the work | scattered; never finishes a thread |
| **Frustration** | effortful struggle at the edge | boredom; no locking-in | disengagement; beliefs about capability |
| **Satisfaction** | a hard thing completed, visibly | no reason to return | complacency; difficulty has drifted too low |
| **Surprise** | a confident wrong prediction, corrected | misconceptions survive untouched | the learner stops trusting their own reasoning |

**Surprise is the most underused.** A trap question the learner's wrong model answers confidently — then a trace proving it wrong — dislodges a misconception in a way no amount of correct exposition will. The learner's session 3 turned on exactly this: the `10101` trace that contradicted their own S3 → S0 instinct.

Use it deliberately, but not constantly. Its power comes from the learner's trust in their own reasoning, and that is spendable.

---

## Part 4 — Logging

The band is only meaningful against real history, so per session record to `learner_records/mastery.md`:

- graded items: total, correct, "I don't know" — and the resulting success rate
- the located edge per strand, as of this session
- consecutive-miss events and what was done about them
- how the session opened and how it closed
- any observed affect signal worth carrying forward: visible frustration, a moment of genuine delight, a request to stop or to push harder

The learner's own reports override the numbers. If the band says 78% and they say it felt brutal, the band is wrong — recalibrate and note why.
