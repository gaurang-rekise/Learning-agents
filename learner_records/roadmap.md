# Master Roadmap: Digital Electronics (Principal Expert Path)

## Current Status: Sprint 1 (Modules 1 & 2)
* **Focus:** Tier 1 — Bridging the gap from Basic ETC to Engineering Rigor.
* **Active Milestones:**
  1. Read Harris & Harris (Chapters 1–3). — *Not started. **Now blocking** — K-maps are required to simplify the detector's next-state logic.*
  2. Build a 4-bit Binary Adder in Logisim using only basic gates. — *Not started.*
  3. Master the concept of a State Transition Diagram. — *Understanding complete (2026-07-07): learner derived the full 4-state overlapping `1-0-1` detector FSM on paper, including state minimisation and overlap transitions. **Practice and application still open** — never re-derived under time, never built.*
* **Last Session:** [2026-07-07 Session 3](sessions/2026-07-07_session3.md) — `1-0-1` detector FSM completed on paper.
* **Gap since last session:** ten weeks as of 2026-09-17. Every established floor is a hypothesis to re-confirm, not a fact to inherit.

### How status is tracked

A module is complete when its nodes carry evidence in **all four** learning aspects — discovery, understanding, practice, application (`pedagogy/learning-aspects.md`). Coverage is not completion.

The per-node, per-aspect ledger is [mastery.md](mastery.md). The checkboxes below are a roll-up of it, not an independent record; when the two disagree, the ledger is right.

`[ ]` not started · `[~]` in progress, see ledger · `[x]` all four aspects evidenced

---

### Tier 1: The Undergraduate Foundation
- [ ] **Module 1: Boolean Algebra & Combinational Logic**
    - *Status:* Not started. **Blocking Module 2** — K-map simplification is needed for the detector's next-state logic.
    - *Goal:* 4-bit Binary Adder in Logisim.
    - *Resources:* [Module 1 Reading List](resources/module1_reading_list.md) · [Logisim Lab Resources](resources/logisim_lab_resources.md)
- [~] **Module 2: Sequential Logic & FSMs**
    - *Status:* Conceptual design mastered; implementation untouched. 8 nodes tracked, 6 with understanding, **0 with application**.
    - *Goal:* `1-0-1` Sequence Detector using D-Flip Flops.
    - *Open:* state encoding → next-state truth table → K-map simplification → Logisim wiring. Blocked on Module 1's K-maps.
    - *Resources:* [Module 2 Reading List](resources/module2_reading_list.md) · [Logisim Lab Resources](resources/logisim_lab_resources.md)
- [ ] **Module 3: Digital Integrated Circuits (DIC)**
    - *Status:* Not started. CMOS transistor operation is a declared diagnostic gap.
- [ ] **Module 4: Hardware Description Languages (HDL)**
    - *Status:* Not started.

### Tier 2: The Graduate Specialization (The Architect)
- [ ] Module 5: Computer Architecture
- [ ] Module 6: VLSI Design
- [ ] Module 7: DSP Hardware
- [ ] Module 8: Advanced HDL & Verification

### Tier 3: The Research Frontier (The Doctorate)
- [ ] Module 9: Advanced Device Physics
- [ ] Module 10: Low-Power & High-Speed Design
- [ ] Module 11: Specialized Architectures
- [ ] Module 12: Research Methodology

### Tier 4: The Principal Industry Expert (The Distinguished Engineer)
- [ ] Module 13: SoC Integration
- [ ] Module 14: Tape-out & Fabrication Flow
- [ ] Module 15: Hardware-Software Co-Design
- [ ] Module 16: Strategic Technical Leadership
