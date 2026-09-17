# Flashcard Deck: Digital Electronics

*Spaced repetition per `pedagogy/formats/flashcard.md`. SM-2: new = 1d / ease 2.5, first Good → 6d, ease floors at 1.3.*
*This file is the source of truth. Any published review page is a view of it.*

**Seeded 2026-09-17** from facts the learner established in sessions 2–3. Wording is taken from the learner's own phrasing where the session logs recorded it — self-generated phrasing is recalled measurably better than supplied phrasing.

All cards start due immediately: the material is ten weeks cold and none of it has ever been reviewed.

---

### card-id: and-gate-state-count
- **Front:** How many states does an AND gate have, and why?
- **Back:** Zero. You can predict its output from the current inputs alone, so it stores nothing.
- **Node:** combinational-vs-sequential
- **Created:** 2026-09-17
- **Due:** 2026-09-17
- **Interval:** 1d
- **Ease:** 2.5
- **History:** 2026-09-17 new

### card-id: state-memory-test
- **Front:** What is the test for whether a circuit has state?
- **Back:** Can you predict the output from the current inputs alone? If yes, it has no state.
- **Node:** state-memory-test
- **Created:** 2026-09-17
- **Due:** 2026-09-17
- **Interval:** 1d
- **Ease:** 2.5
- **History:** 2026-09-17 new

### card-id: combinational-definition
- **Front:** Define combinational logic.
- **Back:** Output is a function of the current inputs only. Zero stored state.
- **Node:** combinational-vs-sequential
- **Created:** 2026-09-17
- **Due:** 2026-09-17
- **Interval:** 1d
- **Ease:** 2.5
- **History:** 2026-09-17 new

### card-id: std-completeness-rule
- **Front:** In a state transition diagram, how many arrows must leave each state?
- **Back:** One per possible input — every state handles every input, no missing arrows.
- **Node:** std-notation
- **Created:** 2026-09-17
- **Due:** 2026-09-17
- **Interval:** 1d
- **Ease:** 2.5
- **History:** 2026-09-17 new

### card-id: state-equivalence
- **Front:** When are two states actually the same state?
- **Back:** When no future input sequence distinguishes them.
- **Node:** state-equivalence
- **Created:** 2026-09-17
- **Due:** 2026-09-17
- **Interval:** 1d
- **Ease:** 2.5
- **History:** 2026-09-17 new

### card-id: fsm-s1-meaning
- **Front:** In the 1-0-1 detector, what does S1 mean?
- **Back:** Seen `1`.
- **Node:** fsm-101-detector
- **Created:** 2026-09-17
- **Due:** 2026-09-17
- **Interval:** 1d
- **Ease:** 2.5
- **History:** 2026-09-17 new

### card-id: fsm-s2-meaning
- **Front:** In the 1-0-1 detector, what does S2 mean?
- **Back:** Seen `1`, then `0` — one input away from firing.
- **Node:** fsm-101-detector
- **Created:** 2026-09-17
- **Due:** 2026-09-17
- **Interval:** 1d
- **Ease:** 2.5
- **History:** 2026-09-17 new

### card-id: fsm-s3-on-zero
- **Front:** In the overlapping 1-0-1 detector, S3 receives a `0`. Which state?
- **Back:** S2. The `0` is itself the start of a potential new `1-0-1`, so the live progress is kept.
- **Node:** overlapping-vs-nonoverlapping
- **Created:** 2026-09-17
- **Due:** 2026-09-17
- **Interval:** 1d
- **Ease:** 2.5
- **History:** 2026-09-17 new

### card-id: fsm-s2-on-zero
- **Front:** In the 1-0-1 detector, S2 receives a `0`. Which state, and why?
- **Back:** S0. `0,0` starts nothing, so there is no live progress left to keep.
- **Node:** fsm-101-detector
- **Created:** 2026-09-17
- **Due:** 2026-09-17
- **Interval:** 1d
- **Ease:** 2.5
- **History:** 2026-09-17 new

### card-id: states-vs-transitions
- **Front:** What do states encode, and what do transitions encode?
- **Back:** States encode progress. Transitions encode reuse.
- **Node:** transitions-encode-reuse
- **Created:** 2026-09-17
- **Due:** 2026-09-17
- **Interval:** 1d
- **Ease:** 2.5
- **History:** 2026-09-17 new

### card-id: detector-state-encoding
- **Front:** What 2-bit encoding was chosen for the 1-0-1 detector's four states?
- **Back:** S0=00, S1=01, S2=10, S3=11 — driving two D flip-flops.
- **Node:** state-encoding
- **Created:** 2026-09-17
- **Due:** 2026-09-17
- **Interval:** 1d
- **Ease:** 2.5
- **History:** 2026-09-17 new

---

## Not yet carded

Facts that will need cards once the underlying node reaches understanding. **Do not card these yet** — `pedagogy/formats/flashcard.md`: never drill an unestablished node.

- K-map adjacency and Gray-code ordering (`kmap-simplification` — not started)
- D flip-flop characteristic equation (`dff-behaviour` — never taught)
- Setup and hold time definitions (`dff-behaviour`)
- Moore vs. Mealy output timing (not yet distinguished in any session)
