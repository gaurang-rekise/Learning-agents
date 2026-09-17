# Mastery Ledger: Digital Electronics

*Per-node evidence across the four learning aspects. See `pedagogy/learning-aspects.md`.*
*Seeded 2026-09-17 from sessions 1–3. Owned by the Progress Mentor — nothing else writes here.*

**A node is mastered only when all four aspects carry dated evidence.** Half-mastered is a real state and is recorded as such.

Legend: `x` evidence recorded · `~` partial, see note · `-` none

---

## Module 2 — Sequential Logic & FSMs

### combinational-vs-sequential
> Combinational output = f(current inputs), zero states. Sequential output depends on stored state.

| Aspect | | Evidence |
|---|---|---|
| discovery | `x` | 2026-06-29 — light-switch analogy; saw why "state" needs to exist |
| understanding | `x` | 2026-07-02 — self-derived that an AND gate has zero states, via the memory test |
| practice | `~` | 2026-07-07 — active recall passed once, same-week. Not re-tested since |
| application | `-` | — |

### state-memory-test
> The operational test for whether something has state: *can you predict the output from the current inputs alone?*

| Aspect | | Evidence |
|---|---|---|
| discovery | `x` | 2026-07-02 — arose from needing to resolve the AND-gate misconception |
| understanding | `x` | 2026-07-02 — applied it unaided to reach the right conclusion |
| practice | `-` | — |
| application | `-` | never applied to an unfamiliar circuit |

### std-notation
> Every state must handle every input — no missing arrows. Self-loops are valid transitions.

| Aspect | | Evidence |
|---|---|---|
| discovery | `x` | 2026-07-02 |
| understanding | `x` | 2026-07-02 — stated both rules as rules, not as observations |
| practice | `x` | 2026-07-07 — verified 4 states × 2 inputs = 8 arrows, no gaps, unprompted |
| application | `-` | — |

### fsm-turnstile
> First complete FSM: 2 states × 2 inputs, including the coin-absorbing self-loop in Unlocked.

| Aspect | | Evidence |
|---|---|---|
| discovery | `x` | 2026-07-02 |
| understanding | `x` | 2026-07-02 — derived all 4 transitions unaided, including the non-obvious one |
| practice | `-` | — |
| application | `~` | 2026-07-02 — lab rung only: technique was named in the brief |

### state-equivalence
> If no future input distinguishes two states, they are one state. "Power-on" and "seen only 0s" collapse.

| Aspect | | Evidence |
|---|---|---|
| discovery | `x` | 2026-07-07 — arose from a real labeling ambiguity, not from a lecture |
| understanding | `x` | 2026-07-07 — used it to justify collapsing to 4 states |
| practice | `-` | — |
| application | `-` | not applied to any second machine |

### fsm-101-detector
> The 4-state overlapping `1-0-1` sequence detector. S0 no progress · S1 seen 1 · S2 seen 1,0 · S3 fired.

| Aspect | | Evidence |
|---|---|---|
| discovery | `x` | 2026-07-02 — sequence detection posed as the bridge to the Module 2 goal |
| understanding | `x` | 2026-07-07 — derived all 8 transitions from scratch, incl. minimisation and overlap |
| practice | `-` | never re-derived under time; never rebuilt from a blank page |
| application | `-` | **never built.** The Logisim implementation is the open Module 2 goal |

**This row is the clearest illustration of why the four-aspect model replaced the checkbox.** Complete understanding, zero application. The roadmap checkbox stayed empty for two months because a single box could not say that.

### transitions-encode-reuse
> States encode progress; transitions encode reuse. Safety lives in the transitions, not in extra states.

| Aspect | | Evidence |
|---|---|---|
| discovery | `x` | 2026-07-07 — emerged from the `1001` trap |
| understanding | `x` | 2026-07-07 — stated as a generalisation, then used on `10101` |
| practice | `-` | — |
| application | `-` | — |

*The highest-value node in the ledger: it is the one that generalises beyond this machine. Worth a transfer task once implementation is done.*

### overlapping-vs-nonoverlapping
> `S3 --0--> S2` preserves live progress (overlapping). `S3 --0--> S0` discards it and misses `10101`.

| Aspect | | Evidence |
|---|---|---|
| discovery | `x` | 2026-07-07 |
| understanding | `~` | 2026-07-07 — reached it, but **only after** initially answering S0 and being corrected by a trace |
| practice | `-` | — |
| application | `-` | — |

---

## Not started

Nodes the plan depends on, with no evidence in any aspect:

| Node | Blocks | Note |
|---|---|---|
| `kmap-simplification` | everything below | **Currently blocking.** Needs Harris & Harris Ch. 1–2 |
| `state-encoding` | the Logisim build | 2-bit: S0=00, S1=01, S2=10, S3=11. Path already fixed in session 3 |
| `next-state-truth-table` | K-map input | 8 rows: Q1 Q0 + input → Q1' Q0' + fire. Assigned as homework, not collected |
| `dff-behaviour` | the Logisim build | Never taught. Assumed, never established |
| `boolean-algebra` | Module 1 | Module 1 not started |
| `binary-adder` | Module 1 goal | Module 1 not started |
| `cmos-transistor-operation` | Module 3 | Declared gap at diagnostic; untouched |

---

## Located edges

*Per strand, as of 2026-07-07. **All of these are now stale** — see the decay warning below.*

| Strand | Floor (known) | Ceiling (runs out) |
|---|---|---|
| FSM conceptual design | derives complete minimal FSMs unaided, incl. overlap and equivalence | — **no ceiling found.** Never probed past correct derivation |
| FSM implementation | — **no floor established** | encoding, flip-flops, next-state logic all untested |
| Boolean algebra / K-maps | — **no floor established** | unknown; never probed |
| Logisim tooling | profile claims familiarity | **never demonstrated in any session** — unverified claim |
| CMOS / device physics | — | declared gap, untouched |

> ⚠️ **Two edges are bracketed on one side only, and one is entirely unmeasured.** Per `pedagogy/calibration-and-affect.md`, a one-sided bracket tells you almost nothing. The FSM-conceptual strand needs escalation until something breaks; the K-map strand needs a floor before anything can be planned on it.

> ⚠️ **Decay: the last session was 2026-07-07 — ten weeks before this ledger was seeded.** Every floor above is a hypothesis to re-confirm, not a fact to inherit. Re-test before building.

---

## Misconception log

| # | Misconception | Caught | Status | Re-test |
|---|---|---|---|---|
| 1 | Input combinations = states. Conflated an AND gate's 2² input space with state count | 2026-07-02 | **Closed** — active recall passed 2026-07-07 | — |
| 2 | Discarding live progress: instinct that `S3 --0-->` goes to S0, which misses `10101` | 2026-07-07 | **Open** — corrected by trace in-session, never independently re-tested | **overdue** (was due next session) |
| 3 | Mirror image of #2: fear of false firing on `1001`, expecting a need for extra states | 2026-07-07 | Resolved in-session by trace | 2026-09-24 (light) |

**Convention adopted 2026-07-07:** states are labelled `S0, S1, …` — labels that look like input values ("state 0") caused a real collision.

---

## Quiz history

| Date | Node | Result | Picked | Note |
|---|---|---|---|---|
| 2026-07-07 | combinational-vs-sequential | ✓ | AND gate = 0 states | opening active recall; misconception #1 did not recur |
| 2026-07-07 | overlapping-vs-nonoverlapping | ✗ | S3 → S0 | misconception #2; corrected by tracing `10101` |
| 2026-07-07 | transitions-encode-reuse | ✓ | S1 self-loop on `11` | reasoned that the new 1 replaces the old as live progress |

**Recorded success rate: not tracked before 2026-09-17.** Sessions 1–3 predate the calibration protocol, so no band was measured. Start measuring at session 4.

---

## Calibration history

| Session | Graded | Correct | I-don't-know | Rate | Edge movement |
|---|---|---|---|---|---|
| 1 (2026-06-29) | — | — | — | not tracked | initial diagnostic, qualitative only |
| 2 (2026-07-02) | — | — | — | not tracked | FSM conceptual floor established |
| 3 (2026-07-07) | ~3 | 2 | 0 | ~67% (est.) | no ceiling found on FSM conceptual |
