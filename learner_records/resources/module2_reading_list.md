# Module 2 Reading List: Sequential Logic & FSMs
*Path to Mastery: Digital Electronics (Principal Expert Path)*

This reading list contains curated resources to bridge the gap from combinational logic to sequential systems, focusing on the concepts of state, clocking, latches, flip-flops, and state-machine design.

---

## Part 1: Core Theoretical Foundations of Sequential Systems
These resources teach how memory is integrated into digital systems via feedback loops and clocks, culminating in Finite State Machine (FSM) optimization and state reduction.

### 1. "Digital Design and Computer Architecture" (Chapter 3: Sequential Logic Design)
* **Authors:** David Money Harris and Sarah L. Harris
* **Format:** Textbook
* **Level:** Intermediate (Undergraduate Core)
* **Cost:** Paid
* **Estimated Time:** 6–8 hours
* **Reliability Score:** Industry & Academic Standard
* **Usage & Sequencing:** **Read first.** Focus on Latches, Flip-Flops, synchronous sequential logic design, and Finite State Machines (Moore vs. Mealy). This will directly prepare you for the 1-0-1 sequence detector lab.

### 2. "Digital Design" (Chapters on Sequential Logic & State Reduction)
* **Author:** M. Morris Mano
* **Format:** Physical/Digital Textbook
* **Level:** Intermediate (Undergraduate Core)
* **Cost:** Paid / Library access
* **Estimated Time:** 8–10 hours
* **Reliability Score:** Academic & Industry Standard (Highly Peer-Reviewed)
* **Usage & Sequencing:** **Read alongside Harris & Harris Chapter 3.** Focus specifically on the chapters covering Latches, Flip-Flops (D, JK, T), state equations, state table analysis, and the formal procedures for state minimization/reduction.
* **Accessible Alternative:** **MIT 6.004 OCW (Computation Structures)**, *Lectures on Sequential Logic and Finite State Machines*.
  * *Format:* Free Online Lecture Notes & Slides.
  * *Cost:* Free.
  * *Est. Time:* 4 hours.
  * *Reliability:* Academic Standard.

---

## Part 2: Systems-Level Integration & Clocking
To understand how hardware components are synchronized at the system level and how state machines control data paths.

### 3. "Introduction to Computer Systems" (Sections on Latches & FSMs)
* **Institution:** Carnegie Mellon University (CMU Course 15-213 / 18-213)
* **Format:** Free Online Lecture Notes & Video Materials
* **Level:** Intermediate-Advanced
* **Cost:** Free
* **Estimated Time:** 3–4 hours
* **Reliability Score:** University-Grade Standard (Highly Reputable)
* **Usage & Sequencing:** **Read second.** Focus on how logic states transition under clock control and how timing boundaries (setup time, hold time) prevent metastability in state registers.
* **Special Note on Course Selection:** While CMU 15-213 is CS-focused, CMU **18-100 (Introduction to Electrical and Computer Engineering)** and **18-240 (Structure and Design of Digital Systems)** provide more hardware-native perspectives on FSM implementation and sequential timing analysis. They are recommended here as highly relevant cross-references.

---

## Critical Expert Debate: State vs. Buffer Reading
In your diagnostic, a key conceptual gap was identified: treating sequence detection as a "buffer reading" problem (storing history in registers and parsing them) rather than a "state transition" problem.

### The Architectural Trade-Off:
1. **The Buffer Shift-Register Approach:**
   * *Mechanism:* Shift the serial input into a 3-bit register and use a combinational decoder to look for the pattern `1-0-1`.
   * *Pro:* Very simple to implement and conceptually straightforward.
   * *Con:* Scalability is poor. For long or complex patterns, the register width and combinational decoder size grow linearly or exponentially. It is also highly vulnerable to glitches if inputs are not synchronized.
2. **The Finite State Machine (FSM) Approach (Mealy or Moore):**
   * *Mechanism:* The system transitions through a predefined set of states (e.g., State A: Reset, State B: Saw '1', State C: Saw '1-0', State D: Saw '1-0-1').
   * *Pro:* The system's memory is embedded directly in its state representation. It requires only $\lceil \log_2(\text{states}) \rceil$ flip-flops (2 flip-flops for a 4-state detector). FSMs scale cleanly to represent complex protocols (e.g., PCIe, DDR) without needing massive shift registers.
   * *Con:* Designing the state transition logic requires careful state minimization to avoid redundant states.

---

## Part 3: Practical Lab & Verification

### 4. Logisim Goal: 1-0-1 Sequence Detector
* **Goal:** Successfully build a synchronous `1-0-1` sequence detector using D-Flip Flops and a Clock signal.
* **verification:** Verify that your circuit asserts the output when the sequence is detected and resets correctly on mismatched inputs.
