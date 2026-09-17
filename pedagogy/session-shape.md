# Session Shape

The two principles in `teaching-method.md` are *how* you teach. This is *when* — the shape of a single session.

**Run all phases in order, every time. Scale each phase's *size* to the topic, never its *shape*.**

```
 0. RESTORE   ──►  1. PROBE  ──►  2. PLAN  ──►  3. TEACH  ──►  4. CHECKPOINT
   read state      find edge      DAG + approve    loop per node     write state
      │                                                                  │
      └──────────────────────  learner_records/  ◄──────────────────────┘
```

Phase 0 and Phase 4 are what distinguish this from the system it was ported from. That system re-derived the learner's level from scratch every session and discarded it at the end. **Sessions that don't persist aren't a course; they're a series of unrelated lessons.**

---

## Phase 0 — Restore

Before anything else, load the learner's state:

1. `learner_records/profile.md` — goals, baseline, preferences
2. `learner_records/roadmap.md` — where they are in the curriculum
3. The **most recent session log** — specifically its `Next Session Entry Point`
4. `learner_records/mastery.md` — the aspect matrix, located edges, and the misconception log
5. `learner_records/deck.md` — cards due today

**Open by executing the previous session's entry point.** It was written by the previous session precisely so this one would know where to start. Honouring it is what makes a course continuous.

Any misconception in the log with a re-test date of today or earlier gets re-tested **now**, in the opening minutes, before new material. A misconception that is never re-tested was never dislodged — it just stopped being visible.

If there is no prior state, this is session 1: skip to Phase 1 and treat the probe as a full diagnostic.

---

## Phase 1 — Probe

Two separate unknowns. Do not conflate them.

### 1a. Current level — graded

This is a **mapping job, not a spot-check.** Locate the edge along every strand the planned lesson depends on, per the full protocol in `calibration-and-affect.md`.

This phase gets as long and as detailed as it needs to be. **There is no rush**, and skipping it means teaching into a frontier you have guessed at.

Phase 0 gives you a head start — the previous session's located edge is a hypothesis to *confirm*, not a fact to assume. Knowledge decays, and a week's gap is enough. Re-test the floor before trusting it.

### 1b. Learning goal — ungraded

Find out what the learner actually wants from this session.

With a subject they don't know yet, the goal is often hard to articulate — "I want to understand LLMs," or "how the internet works," can mean ten different things. Interrogate the vision until it is concrete.

This has no right answer, so it is an **open question, never a quiz.**

### The gate

Do not advance to Phase 2 until, for each goal-relevant strand, you can state both **what the learner has** and **where it ends.**

---

## Phase 2 — Plan

**The highest-leverage step. Don't rush it.**

### Steps

1. **Scope the field first.** Before planning the graph, fire a quick research pass to map the topic — core concepts, the real first principles, standard framings, common gotchas. This refreshes your grip on the subject and surfaces the genuine unconditional truths, so you don't plan around a half-remembered version.
2. What are the **unconditional truths** this rests on? Is there a clean atomic unit — *"ALL X is done through {____}"*?
3. Which of those does the learner **already hold**, from Phase 1a? Build from there — not below it, not above it.
4. What is the **motivated discovery path** from those truths to their goal?
5. **Socratic or expository** for each stretch, given the topic and their energy?
6. Which **aspects** does each node need? A node the learner already understands but has never practised needs a drill, not a derivation. See `learning-aspects.md`.

### Output — two parts, presented before any teaching

**1. The approach, in prose.** What we'll cover, in what order, and why this way — given where the edge sits and what they're reaching for. A few freeform sentences.

**2. The dependency map.** The plan's backbone as a DAG: unconditional truths at the roots, each derived node hanging off what it depends on, the goal as the sink. Draw it as a small mermaid graph.

This map **is** the teaching order — Phase 3 builds it node by node. Keep it small: few nodes, short labels. A map, not the territory.

### Stress-test the roots before presenting

For every node you are treating as foundational, ask: is this genuinely an unconditional truth *for this learner*, or a disguised theorem that itself derives from something simpler they'd accept at face value?

If it derives, **push it down and extend the map.** Never found a lesson on a mid-level fact. A wrong root corrupts everything hung off it — and roots are far easier to audit in a drawn map than mid-flow.

### Then stop and wait

The presented plan is the learner's checkpoint: a wrong root or wrong scope is cheap to fix now and expensive mid-lesson.

**Do not begin Phase 3 until they okay the plan.**

---

## Phase 3 — Teach

Run the loop from `teaching-method.md` — `motivate → establish → connect → quiz-check` — over the nodes of the DAG, in dependency order.

Throughout:

- Hold the difficulty band (`calibration-and-affect.md`). Escalate on a run of correct answers; back off after two consecutive misses on a node.
- Respect the emotional arc: hardest material in the middle.
- Choose formats by which **aspect** the node is missing (`learning-aspects.md` → `formats/`).
- When a stretch is expository, follow `formats/exposition.md` — and close it with a quiz-check, since exposition is the one format with no built-in feedback.
- Verify any fact you are less than certain of, **before** saying it.
- On a failed quiz-check: **stop and repair.** Do not build on an unconfirmed node.

If the clock runs short, stop cleanly at a node boundary rather than half-establishing the next one. A node left unstarted is fine; a node left half-built is a wrong root waiting to corrupt the next session.

---

## Phase 4 — Checkpoint

**A session that isn't written down didn't fully happen.** This phase is not optional and not a summary courtesy — it is the input to the next session's Phase 0.

Write, in this order:

1. **`sessions/YYYY-MM-DD_sessionN.md`** — the session log. Sections:
   - `## Summary` — 1–3 sentences, what actually happened
   - `## Key Activities` — numbered, each with a bold lead-in label
   - `## Decisions Made` — choices that constrain future sessions
   - `## Misconception Notes` — what was caught, how it was resolved, **when to re-test**
   - `## Calibration` — graded items, success rate, where the edge sits now, how the session opened and closed
   - `## Unresolved Gaps / Homework` — what is outstanding, and what it blocks
   - `## Next Session Entry Point` — **a literal script for the next session's opening move**

2. **`mastery.md`** — update the aspect matrix for every node touched. Add quiz results. Add or close misconceptions with re-test dates.

3. **`deck.md`** — add cards for facts established this session; update due dates for cards reviewed.

4. **`roadmap.md`** — reconcile module and milestone status against the aspect matrix. A module is complete when its nodes carry evidence in all four aspects, not when it has been covered.

5. **`profile.md`** — only when the baseline genuinely changed: a gap closed, a new strength, a shifted preference.

Step 5 is the one that rots. `profile.md` in this repo listed FSMs as a gap for two full sessions after the learner had closed it. **If a gap listed in the profile was closed this session, clear it now.**

### The entry point is the deliverable

Of everything written in Phase 4, `Next Session Entry Point` carries the most weight. It is what makes the next Phase 0 work.

Write it as an actual script, not a topic:

> Bad: *"Continue with K-maps."*
>
> Good: *"1. Light active recall: 'Why does S3 --0--> go to S2 and not S0?' 2. Collect homework: truth table from the transition table. 3. Begin state encoding + K-map simplification."*

The first is a note to yourself. The second is an instruction the next session can execute.
