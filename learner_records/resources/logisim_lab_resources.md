# Logisim Lab Resources: Getting Started + Both Sprint 1 Labs
*Path to Mastery: Digital Electronics (Principal Expert Path)*
*Researched & verified live: 2026-07-08*

Supplements the generic "Logisim-Evolution Documentation & Tutorials" entries in the Module 1 & 2 reading lists with concrete, verified links.

---

## Part 1: Logisim-Evolution Fundamentals (~2 hours)

### 1. Official Beginner's Tutorial
* **URL:** https://mbaillif.github.io/Logisim-evolution-documentation/en/html/guide/tutorial/index.html
* **Format:** Official documentation | **Cost:** Free | **Est. Time:** 30 min
* **Reliability Score:** Official Project Documentation
* **Usage & Sequencing:** **Read first.** Placing gates, wiring, poking inputs, step-by-step simulation mode.

### 2. Logisim-Evolution User's Guide
* **URL:** http://baillifard.com/logisim/en/html/guide/
* **Format:** Official documentation | **Cost:** Free | **Est. Time:** 1–2 hrs (early sections)
* **Reliability Score:** Official Project Documentation
* **Usage & Sequencing:** Read early sections cover-to-cover; use as reference after. Busses, splitters, and clock configuration live here.

### 3. Logisim-Evolution (software download)
* **URL:** https://github.com/logisim-evolution/logisim-evolution
* **Format:** Open-source Java application (requires Java 21+) | **Cost:** Free
* **Reliability Score:** Official Project Repository

### 4. Cornell CS 3410 Lab 1: Introduction to Logisim
* **URL:** https://www.cs.cornell.edu/courses/cs3410/2019sp/labs/lab1/
* **Format:** University lab handout | **Cost:** Free | **Est. Time:** 1 hr
* **Reliability Score:** Academic Standard
* **Usage & Sequencing:** Optional guided first lab; teaches subcircuit discipline and testing habits.

---

## Part 2: Lab 1 — 4-bit Binary Adder (Module 1 Goal, Milestone 2)

Build order: half adder → full adder (two half adders) → chain 4 full adders (carry-out → next carry-in; ground the first carry-in). Make each stage a reusable subcircuit.

### 5. JMU CS 101 Logisim Adder Lab
* **URL:** https://w3.cs.jmu.edu/cs101/unit02/Lab02-Logisim.html
* **Format:** University lab handout | **Cost:** Free | **Est. Time:** 1–2 hrs
* **Reliability Score:** Academic Standard
* **Usage & Sequencing:** **Primary lab guide.** Walks the exact half-adder → full-adder → 4-bit RCA progression with pin/facing details.

### 6. Video Walkthroughs (choose one)
* **URLs:** https://www.youtube.com/watch?v=OkzoRnjOuNw , https://www.youtube.com/watch?v=DQWpjpjoy4o
* **Format:** YouTube | **Cost:** Free | **Est. Time:** ~20 min each
* **Reliability Score:** Community Standard

### 7. Concordia COEN 312 Ripple-Carry Adder Notes
* **URL:** https://users.encs.concordia.ca/~asim/coen312/Lectures/RCA.pdf
* **Format:** Lecture PDF | **Cost:** Free | **Est. Time:** 30 min
* **Reliability Score:** Academic Standard
* **Usage & Sequencing:** Theory of carry propagation delay — connects forward to the Kogge-Stone vs. Brent-Kung debate in the Module 1 list.

---

## Part 3: Lab 2 — `1-0-1` Sequence Detector (Module 2 Goal)

Learner's own 4-state Moore FSM (designed on paper, session 3, 2026-07-07) is the spec. Implementation: 2-bit state encoding → two D flip-flops → next-state truth table → K-map simplification → wire in Logisim with clock.

### 8. GeeksforGeeks: Design 101 Sequence Detector (Mealy)
* **URL:** https://www.geeksforgeeks.org/digital-logic/design-101-sequence-detector-mealy-machine/
* **Format:** Tutorial article | **Cost:** Free | **Est. Time:** 1 hr
* **Reliability Score:** Community Standard
* **Usage & Sequencing:** Worked state table → excitation table → K-maps → D flip-flop circuit for this exact pattern. **Cross-reference deliberately:** it builds a 3-state *Mealy* machine; the learner's design is a 4-state *Moore* machine. Comparing the two is the Moore-vs-Mealy lesson of Harris & Harris Ch. 3 (state count vs. output timing/glitch behavior).

### 9. Siena College CS 220 Sequential Logic Notes
* **URL:** https://courses.teresco.org/cs220_f11/notes/sequential.pdf
* **Format:** Lecture PDF | **Cost:** Free | **Est. Time:** 1 hr
* **Reliability Score:** Academic Standard
* **Usage & Sequencing:** Covers flip-flop count rule (⌈log₂ N⌉ flip-flops for N states → 2 for this detector).

### 10. Bosworth: Design of the 11011 Sequence Detector
* **URL:** http://www.edwardbosworth.com/My5155_Slides/Chapter07/DesignOfSequenceDetector.pdf
* **Format:** Course slides PDF | **Cost:** Free | **Est. Time:** 1 hr
* **Reliability Score:** Academic Standard
* **Usage & Sequencing:** A second, longer worked pattern to verify the design method against after completing the 1-0-1 lab.

---

## Recommended Path
1. Beginner's tutorial (#1) → install (#3).
2. Adder lab (#5, video #6 as backup) — pure combinational, no clock.
3. User's guide clock/bus sections (#2).
4. Detector lab: implement own Moore FSM; cross-check method against #8; note Moore/Mealy contrast.
