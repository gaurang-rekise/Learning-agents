# Module 1 Reading List: Boolean Algebra & Combinational Logic
*Path to Mastery: Digital Electronics (Principal Expert Path)*

This reading list contains curated resources to build a deep, graduate-level understanding of combinational design. It begins with the fundamental mathematics of boolean operations and builds up to high-speed arithmetic layout design and transistor-level CMOS implementation.

---

## Part 1: Core Theoretical Foundations
These resources establish the mathematical rules of Boolean Algebra and standard combinational circuits (adders, multiplexers, decoders).

### 1. "Digital Design and Computer Architecture" (Chapters 1 & 2)
* **Authors:** David Money Harris and Sarah L. Harris
* **Format:** Physical/Digital Textbook
* **Level:** Intermediate (Undergraduate Core)
* **Cost:** Paid (~$60) / Academic library access
* **Estimated Time:** 8–10 hours
* **Reliability Score:** Industry & Academic Standard (Highly Peer-Reviewed)
* **Usage & Sequencing:** **Read first.** This textbook bridges the gap between pure Boolean logic and practical hardware designs. It introduces logic gates, Karnaugh Maps, and base-level Ripple Carry Adders in a clear, engineering-centric manner.
* **Accessible Alternative:** **MIT 6.004 OpenCourseWare (Computation Structures)**, specifically *Lectures 2 & 3: Combinational Logic*. 
  * *Format:* Free Online Course Notes & Slides. 
  * *Cost:* Free. 
  * *Est. Time:* 4 hours. 
  * *Reliability:* Academic Standard.

### 2. "The Art of Assembly Language" (Chapter 2: System Organization & Boolean Algebra)
* **Author:** Randall Hyde
* **Format:** Free Online Digital Book (Internet Archive)
* **Level:** Beginner-Intermediate
* **Cost:** Free
* **Estimated Time:** 2 hours
* **Reliability Score:** Community Standard
* **Usage & Sequencing:** **Read alongside Harris & Harris.** If you prefer to understand Boolean logic through the lens of assembly optimization and memory-register addressing, this is an excellent software-aligned alternative.

---

## Part 2: Transistor-Level CMOS Circuitry
To achieve Principal Expert status, you must understand logic gates not just as abstract symbols, but as silicon circuits composed of PMOS and NMOS transistors.

### 3. "CMOS VLSI Design: A Circuits and Systems Perspective" (Chapter 1 & Section 11.2)
* **Authors:** Neil H. E. Weste and David Money Harris
* **Format:** Textbook
* **Level:** Advanced (Graduate/Doctoral)
* **Cost:** Paid (~$100)
* **Estimated Time:** 6–8 hours
* **Reliability Score:** Industry Gold-Standard
* **Usage & Sequencing:** **Read third.** Focus on the realization of basic gates (NAND, NOR, XOR) in CMOS, pull-up/pull-down network rules, and the concept of *Logical Effort* which determines delay optimization in silicon.
* **Accessible Alternative:** **UC Berkeley EECS 151/251A (Introduction to Digital Design) Lecture Slides on CMOS Logic**.
  * *Format:* Free Lecture PDFs (available via Berkeley EECS website).
  * *Cost:* Free.
  * *Est. Time:* 2–3 hours.
  * *Reliability:* Academic Standard.

### 4. "Digital Integrated Circuits: A Design Perspective" (Chapter 6: Designing Combinational Logic Gates in CMOS)
* **Author:** Jan M. Rabaey
* **Format:** Textbook
* **Level:** Advanced (Graduate/Doctoral)
* **Cost:** Paid
* **Estimated Time:** 8 hours
* **Reliability Score:** Peer-Reviewed Academic & Industry Standard
* **Usage & Sequencing:** **Read fourth.** This is the definitive text for understanding the physics of silicon delay, signal transition times, and parasitic capacitances. Read Chapter 6 to grasp why NAND gates are preferred over NOR gates in CMOS due to electron vs. hole mobility.

---

## Part 3: High-Performance Adder Architectures
Designing a basic 4-bit adder requires only full adders. Scaling to 32-bit or 64-bit ALUs requires high-speed topologies that avoid the $O(N)$ linear propagation delay of Ripple Carry Adders.

### 5. "Tree Adder Taxonomy" & "Parallel Prefix Addition"
* **Sources:** Stanford EE371 / UT Austin EE460 Lecture Notes
* **Format:** Academic Lecture Slides (PDF)
* **Level:** Advanced / Expert
* **Cost:* Free
* **Estimated Time:** 3–4 hours
* **Reliability Score:** Academic Standard
* **Usage & Sequencing:** **Read after CMOS fundamentals.** This introduces Carry-Lookahead Adders (CLA) and Parallel Prefix tree structures (Kogge-Stone and Brent-Kung).

---

## Critical Expert Debate: Kogge-Stone vs. Brent-Kung Adders
When scaling adders to 32 or 64 bits, two dominant parallel prefix trees compete in modern high-performance VLSI design:

| Metric | Kogge-Stone Adder (KSA) | Brent-Kung Adder (BKA) |
| --- | --- | --- |
| **Logic Depth** | $O(\log_2 N)$ - Minimal delay | $O(2\log_2 N - 1)$ - Higher delay |
| **Wiring Congestion** | Extremely High (Massive routing tracks) | Low (Regular, clean routing) |
| **Area / Gate Count** | Large | Small / Compact |
| **Fan-out** | Constant (Fan-out of 2) | Variable |

* **Kogge-Stone Perspective:** Often preferred in CPU arithmetic logic units (ALUs) where raw speed is the absolute priority. The constant logic depth of $\log_2 N$ delivers the fastest delay possible at the cost of wiring density.
* **Brent-Kung Perspective:** Preferred in area-constrained and low-power designs. It reduces horizontal wiring tracks, lowering parasitic wiring capacitance, which in sub-micron processes (e.g., 7nm and below) can actually save enough dynamic power and delay to rival Kogge-Stone's theoretical gate speed.

---

## Part 4: Practical Simulation & Verification

### 6. Logisim-Evolution Documentation & Tutorials
* **Format:** Software Documentation / Guided Exercises
* **Level:** Beginner-Intermediate
* **Cost:** Free (Open Source)
* **Estimated Time:** 2 hours
* **Reliability Score:** Community Standard
* **Usage & Sequencing:** **Read before starting the lab.** This ensures you understand how to route busses, handle bit-splitting, and use simulation clocks in Logisim.
