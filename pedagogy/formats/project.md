# Format: Lab and Project

| | |
|---|---|
| **Serves** | Application (perspective, experience) |
| **Surface** | `learner_records/` for the spec and log; the real tool for the work |
| **Used by** | Phase 3 as the terminal aspect of a node; module completion |

## Why this aspect cannot be skipped

Everything else in this system happens inside a frame the teacher built. The question named the topic, the drill named the procedure, the quiz supplied the options. **Application is where nobody says which tool to reach for.**

That is the only aspect that transfers. A learner who has discovery, understanding, and practice on FSMs but has never built one has knowledge that works in FSM-shaped conversations and nowhere else.

The gap is visible right now in this repo's own records: the `1-0-1` detector is completely understood on paper and has never been built. Those are genuinely different states of knowing, and only the second survives contact with a real problem.

---

## The ladder

Three rungs, in order. Each removes one more piece of scaffolding.

### 1. Lab — scaffolded, single node
> "Build the 4-state `1-0-1` detector in Logisim using two D flip-flops."

The tool, the technique, and the target are all given. Its job is to convert paper understanding into a working artifact, and to surface the gap between them — which is always larger than the learner expects, and is the point.

### 2. Project — integrative, several nodes
> "Build a vending-machine controller that accepts three coin types and dispenses with change."

Multiple nodes must be combined, and the learner chooses how. Design decisions appear that have no single right answer. This is where the dependency graph gets *stress-tested*, because a weak edge shows up as a design that doesn't compose.

### 3. Transfer — unlabelled
> "Here's a spec for a traffic-light controller with a pedestrian button. Nobody mentioned FSMs."

The defining feature is that **the technique is not named.** Recognising that this is an FSM problem *is* the assessment. This is the only rung that proves the application aspect, and it is the one most often skipped.

---

## Writing a spec

```markdown
## lab-id: logisim-101-detector
- **Node(s):** fsm-state-encoding, dff-behaviour, kmap-simplification
- **Rung:** lab
- **Tool:** Logisim-Evolution
- **Brief:** Build the 4-state overlapping 1-0-1 detector using two D flip-flops.

### Acceptance criteria
- [ ] Fires exactly once on `101`
- [ ] Fires twice on `10101` (overlap preserved)
- [ ] Does not fire on `1001`
- [ ] Next-state logic derived via K-map, not trial and error

### Stretch goals
- [ ] Convert to a Mealy machine; compare state count
- [ ] Add a synchronous reset
```

**Acceptance criteria must be checkable by the learner, alone, without the teacher.** That is what makes a lab something they can finish between sessions — and between-session work is where most application actually happens.

**Every criterion should be a behaviour, not a step.** "Fires twice on `10101`" is checkable. "Use K-maps correctly" is not, which is why the fourth criterion above names an observable consequence instead.

**Include at least one criterion that a plausible wrong design fails.** Here it is the overlap case: a learner who built S3 → S0 passes three of the four and fails exactly the one that matters. The spec is a diagnostic, like a good distractor.

**Stretch goals are not optional extras — they are the next rung**, pre-written, so a learner who finishes early climbs instead of idling.

---

## Running it

1. **Hand over the spec, then get out of the way.** Application means unaided; a teacher hovering converts it back into a scaffolded exercise.
2. **Let it fail.** A lab that fails on the overlap case teaches more than one that passes first try, and the debugging *is* the application.
3. **Debrief against the criteria**, not against the code. Which criterion failed, what model produced that failure, which node does that trace back to?
4. **Feed failures back as nodes.** A lab failure is a located gap — treat it exactly like a failed quiz-check, and repair the node.

---

## Marking the aspect

`application` is earned when the learner completes a rung **without being told which technique to use** — which strictly means the transfer rung.

A completed lab is real evidence and should be recorded, but it evidences the *end of practice*, not application. Be honest in the matrix about which rung was reached:

```
- [x] application  2026-10-02  transfer: recognised traffic-light spec as an FSM unprompted
```

versus

```
- [~] application  2026-09-24  lab only: built 101 detector from a given brief
```

The distinction is the difference between a learner who knows FSMs and a learner who will notice one in the wild.
