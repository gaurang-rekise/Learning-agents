# Format: Speed Drill

| | |
|---|---|
| **Serves** | Practice (procedures, fluency, speed) |
| **Surface** | `learner_records/drills/` + a timed page for execution |
| **Used by** | Phase 3, once a node has understanding but no fluency |

## What drills are for

Flashcards make *facts* instant. Drills make *procedures* instant.

The distinction matters: "what does t_su mean" is a card; "given this K-map, produce the minimal SOP expression" is a drill. One is recall, the other is execution under time pressure.

A learner who understands K-map simplification perfectly but takes four minutes per map cannot use it inside a larger problem — the procedure eats all the working memory the actual problem needed. **Fluency is not a luxury on top of understanding; it is what makes understanding usable.**

As with cards: **never drill an unestablished node.** Speed on a procedure the learner cannot justify is the most brittle knowledge there is — it survives exactly until the problem changes shape.

---

## Drill schema

```markdown
## drill-id: kmap-4var-minimal-sop
- **Node:** kmap-simplification
- **Target:** 8 items in 6 minutes, ≥ 7 correct
- **Baseline:** 2026-09-17 — 8 items / 11m20s / 6 correct
- **Best:** —
- **Items:** see below

### Items
1. Given F(A,B,C,D) = Σm(0,1,2,5,8,9,10) → minimal SOP
2. ...
```

| Field | Purpose |
|---|---|
| `Target` | the fluency bar: count, time, accuracy floor |
| `Baseline` | first timed attempt — the number all progress is measured against |
| `Best` | best qualifying run |

**Always record a baseline before setting a target.** A target invented without one is either trivially met or demoralising, and you cannot tell which in advance.

---

## Designing a drill

**Vary the surface, fix the procedure.** Every item must exercise the *same* procedure through a *different* surface. Eight identical-shaped K-maps train pattern-matching on that shape, not the procedure. Eight structurally varied ones train the procedure.

**Items must be short.** If a single item takes longer than ~60 seconds at target speed, it is a lab, not a drill.

**Accuracy floor before speed target.** Speed at 60% accuracy is not fluency, it is guessing quickly. Hold accuracy ≥ 85% and only then push the clock.

**8–12 items per set.** Fewer doesn't measure; more turns into a lab and fatigue confounds the timing.

---

## Running a drill

1. State the target aloud before starting. The learner should know what qualifies as a win.
2. Time the whole set, not each item — per-item timing induces exactly the anxiety that destroys fluency.
3. Score after, not during. No feedback mid-set.
4. Record the run. Every run, including bad ones.
5. Compare to baseline and to best, and **say the delta out loud.** Visible improvement is the entire emotional payload of this format.

Drills are the natural **session closer** (`calibration-and-affect.md`): a drill on a node already established is a near-guaranteed win, and it produces a number that visibly improved. That is the satisfaction beat the arc asks for.

---

## Progression

| Observed | Meaning | Action |
|---|---|---|
| Below accuracy floor | procedure not solid | back to the teaching loop — this is not a speed problem |
| Accuracy fine, far off time | normal early state | repeat the set; expect large early gains |
| Hits target once | promising, not fluent | must hit it on a *later day* to count |
| Hits target on a later day | fluent | mark `practice` in the aspect matrix; retire the drill |
| Was fluent, now isn't | decay | one refresher set; if it doesn't return, the node needs re-teaching |

**Retire drills.** A drill kept in rotation after fluency is reached is wasted time, and worse, it trains the learner to associate the session with busywork.

---

## Logging

Per run, append to the drill file, and update `mastery.md`:

```
| date | drill | items | time | correct | vs best |
|---|---|---|---|---|---|
| 2026-09-17 | kmap-4var-minimal-sop | 8 | 11m20s | 6/8 | baseline |
```

When a drill is passed on a later day, set `practice` in that node's aspect row with the date and the qualifying run.
