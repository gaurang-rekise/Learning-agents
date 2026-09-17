---
name: visualize
description: >
  Add a correct, minimal diagram to a lesson when an idea is clearer as a picture. Use when teaching something structural (dependencies, state machines, flows, hierarchies) or geometric (schematics, K-maps, timing diagrams, coordinate geometry). Briefs a maker subagent that renders and visually verifies the diagram before returning it. Trigger on "draw", "diagram", "visualize", "show me", or whenever a teaching explanation would be carried better by a picture than by prose.
---

# Visualize

**You are the creative director.** You decide the exact idea and distill it to its fewest carrying elements. A **maker subagent** does the authoring, rendering, visual verification, and return. You embed what it gives back.

## When a visual earns its place

This system builds a **dependency graph in the learner's head**. A visual is powerful exactly when it makes that structure — or a geometry — visible.

**Do visualize:**
- structure and relationship: dependencies, state machines, flows, sequences, trees, containment
- spatial and geometric: schematics, K-maps, timing diagrams, coordinate geometry, vectors, physical arrangement

**Do not visualize** when prose or a single equation already carries it. A diagram that restates a sentence costs attention and adds nothing.

**When in doubt, don't.** A missing visual is cheaper than a false one — and a diagram is trusted more than prose, so a wrong one does more damage than a wrong sentence.

## Choosing the maker

| The idea is… | Maker |
|---|---|
| nodes and edges — position carries no meaning | `mermaid-maker` |
| positions and shapes — *where* a thing sits **is** the meaning | `svg-maker` |

Digital electronics needs both routinely: a state transition diagram is mermaid; a K-map, a gate schematic, or a setup/hold timing diagram is SVG. Getting this wrong produces a confident lie — mermaid controls topology, not position.

Default to `mermaid-maker` when genuinely ambiguous.

## Briefing

**The most common failure is cramming.** For each element ask: *if I delete this, is the idea still clear?* If yes, delete it. If your brief lists more than ~5–7 elements, cut it before sending.

**Bad brief:**
> "make a diagram about how FSMs work"

**Good brief:**
> "stateDiagram-v2 with four states S0–S3. S0 on 1 → S1; S0 on 0 → self. S1 on 0 → S2; S1 on 1 → self. S2 on 1 → S3 (mark this transition 'fire'); S2 on 0 → S0. S3 on 0 → S2; S3 on 1 → S1. No title. The point is that S3 --0--> S2 preserves live progress rather than resetting."

The good brief states every element *and the claim the picture must make*. The maker preserves your intent exactly — it will not infer it.

Include: the diagram type, every node and edge, the labels, what to omit, and one sentence on what the reader should take away.

## Invoking

Use the Agent tool with `subagent_type: "mermaid-maker"` or `"svg-maker"`, passing the brief as the prompt.

The maker returns either verified diagram source, or **nothing with a reason** — meaning it could not produce a picture it was confident was correct. Take that at face value: teach it in prose instead.

**Never hand-author or patch a diagram yourself.** Correctness here depends entirely on the maker's render-and-inspect loop; a diagram you wrote and didn't render is exactly the failure mode this pipeline exists to prevent.

## Using what comes back

Introduce the visual in a sentence, then **let it carry the idea** — don't narrate every element back in prose. If you find yourself re-explaining the whole diagram in text, either the diagram failed or it wasn't needed.

Mermaid renders natively in markdown and in Artifacts — embed the source in a fenced ` ```mermaid ` block. SVG embeds inline.

For a diagram the learner should keep, save it into `learner_records/` alongside the node it explains, and link it from the session log.
