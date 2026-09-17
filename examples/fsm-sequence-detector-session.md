# Worked Example: A Real Teaching Session

Traced from `learner_records/sessions/2026-07-07_session3.md` — an actual session, not a constructed one. It shows the loop running, a misconception being dislodged, and what got written down.

**Learner:** Digital Electronics, Principal Expert path. FSM conceptual design in progress.
**Node:** `fsm-101-detector` — the overlapping `1-0-1` sequence detector.

---

## Phase 0 — Restore

Loaded `profile.md`, `roadmap.md`, and session 2's log. Session 2's `Next Session Entry Point` read:

> Open with active recall: "How many states does an AND gate have, and why?" Then collect the learner's answer to the sequence-detector state-enumeration question.

**Executed verbatim.** The misconception log had one open entry — *input combinations ≠ states*, caught in session 2 — due for re-test.

---

## Phase 1 — Probe

**Quiz:** *"How many states does an AND gate have, and why?"*

Correct: **zero — you can predict the output from the current inputs alone.**

The session-2 misconception did not recur. Entry closed. *A misconception that is never re-tested was never dislodged — it just stopped being visible.*

---

## Phase 3 — Teach

### Node: state enumeration → a detour into state equivalence

The learner proposed four states. But their labels collided: "state 0" meant both *the start state* and *seen a lone 0*.

Rather than correcting the label, the tutor followed the ambiguity down — **no future input distinguishes "power-on" from "seen only 0s", so they are one state.** That is state equivalence, and it arrived because the learner's own confusion demanded it, not because a syllabus scheduled it.

> **This is Principle ii working.** The concept was *discovered*, not decreed. Convention `S0–S3` adopted to stop labels colliding with input values.

### Node: overlap — the trap sequences

Three traps, each targeting a specific wrong model.

**Trap `1001`** — the learner feared a false fire. Tracing it showed `S2 --0--> S0` destroys dead progress, since `0,0` starts nothing.
→ *Safety lives in the transitions, not in extra states.*

**Trap `10101`** — the learner answered `S3 --0--> S0`. **Wrong**, and it's the mirror image of the first fear: where `1001` worried about keeping too much, this discards too much. Tracing `10101` showed the second occurrence gets missed.
→ Corrected to `S3 --0--> S2`. *Transitions encode reuse; states encode progress.*

**Trap `11`** — correct: the new `1` replaces the old as live progress.

### Why traps, and not exposition

A confidently-held wrong model cannot be fixed by adding correct information on top of it. It has to be **contradicted by a case the learner's own model gets wrong.** All three traps are that shape: predict, then trace, then watch the prediction fail.

This is the **surprise** beat in `pedagogy/calibration-and-affect.md`. It's the most underused emotion and the most effective — and its power comes from the learner's trust in their own reasoning, which is spendable. Use it deliberately, not constantly.

---

## Deliverable

The learner produced the complete table unaided — 4 states × 2 inputs = 8 arrows, no gaps:

| State | Meaning | on 0 | on 1 |
|---|---|---|---|
| S0 | no progress | S0 | S1 |
| S1 | seen 1 | S2 | S1 |
| S2 | seen 1,0 | S0 | S3 🔔 |
| S3 | fired | S2 | S1 |

---

## Phase 4 — Checkpoint

Written to the session log, then propagated:

**`mastery.md`** — six nodes updated. The important row:

```
### fsm-101-detector
| discovery     | x | 2026-07-02 — posed as the bridge to the Module 2 goal      |
| understanding | x | 2026-07-07 — derived all 8 transitions, incl. overlap     |
| practice      | - | never re-derived under time                               |
| application   | - | never built                                               |
```

**This row is why the four-aspect model replaced the checkbox.** Complete understanding, zero application — and for two months the roadmap checkbox stayed empty because one binary box couldn't express it.

**`deck.md`** — cards for `fsm-s3-on-zero`, `fsm-s2-on-zero`, `states-vs-transitions`.

**Misconception log** — the `S3 --0--> S0` instinct logged **open**, with a re-test date. It was corrected by a trace in-session, but never independently re-tested, so it is not closed.

**Entry point:**

> 1. Light active recall: "Why does S3 --0--> go to S2 and not S0?"
> 2. Collect homework: truth table from the transition table.
> 3. Begin state encoding + K-map simplification, then Logisim wiring.

Executable, not a topic. That is what the next session's Phase 0 runs.

---

## What this example demonstrates

| Principle | Where |
|---|---|
| Restore executes the previous entry point | Phase 0, verbatim |
| Misconceptions get re-tested, not assumed closed | the AND-gate recall |
| Discovery beats decree | state equivalence arrived from a real ambiguity |
| Contradict the model, don't top it up | all three traps |
| Understanding ≠ application | the ledger row, honest about the gap |
| The entry point is the deliverable | a script the next session can run |

## What it also exposes

The session ran well and the record still drifted:

- `profile.md` listed FSMs as an open gap for **two more months** after this session closed it.
- The roadmap checkbox never flipped, because binary couldn't say "understood, never built."
- Misconception #2 was marked *re-test next session* — and the next session was ten weeks later.

The first two are fixed structurally: the aspect matrix, and a Stop hook that forces the checkpoint. The third is a reminder that **a re-test date is only as good as the next session actually happening.**
