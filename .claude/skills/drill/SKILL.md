---
name: drill
description: >
  Build and run practice for facts and procedures — flashcards with spaced repetition, timed speed drills, and published review decks. Use when a node is understood but not yet fast or reliable, when cards are due for review, or when the learner asks to practice, drill, review, or test retention. Also use at session checkpoint to create cards for facts just established. Trigger on "flashcards", "drill", "practice", "review", "cards due", "quiz me on", or "I keep forgetting".
---

# Drill

Practice makes established knowledge **instant**. It does not establish anything.

## The hard prerequisite

**Never drill an unestablished node.**

A card or drill built before the concept is understood produces exactly the memorized-and-rotting knowledge the whole method exists to prevent. Speed on a procedure the learner cannot justify survives only until the problem changes shape.

Check `learner_records/mastery.md` first. If `understanding` isn't marked for the node, stop and send it back to the `teach` skill.

## Cards or drills?

| | Flashcard | Speed drill |
|---|---|---|
| Trains | facts, definitions, correspondences | procedures, execution |
| Example | "what is setup time?" | "minimise this K-map" |
| Measured by | recall after a gap | count × time × accuracy |
| Spec | `pedagogy/formats/flashcard.md` | `pedagogy/formats/drill.md` |

Read the format spec before generating either.

## Flashcards

Stored in `learner_records/deck.md`, which is the source of truth.

```markdown
### card-id: fsm-s2-meaning
- **Front:** In the 1-0-1 detector, what does state S2 mean?
- **Back:** Seen `1`, then `0` — one input away from firing.
- **Node:** fsm-state-encoding
- **Created:** 2026-07-07
- **Due:** 2026-09-20
- **Interval:** 6d
- **Ease:** 2.5
- **History:** 2026-07-07 new · 2026-09-14 good
```

**Writing rules:** one fact per card — an "and" on the back means two cards. The front must be answerable without the deck's context. No caveats on the back; a back needing "well, usually…" means the node hasn't reached understanding. **Prefer the learner's own phrasing** from session transcripts — self-generated wording is recalled measurably better than supplied wording.

**Scheduling (SM-2):** new card starts 1d / ease 2.5; first Good → 6d.

| Grade | Effect |
|---|---|
| Again | interval → 1d; ease − 0.20 |
| Hard | interval × 1.2; ease − 0.15 |
| Good | interval × ease |
| Easy | interval × ease × 1.3; ease + 0.15 |

Ease floors at 1.3.

**Three `Again`s running is not a card problem — it's a node problem.** Pull the card from rotation, note it in the misconception log, and send the node back through the teaching loop. Repetition cannot fix a concept that was never established.

## Speed drills

Stored in `learner_records/drills/`.

**Vary the surface, fix the procedure** — eight identical-shaped items train pattern-matching on that shape, not the procedure. 8–12 items, each under ~60s at target speed; longer means it's a lab.

**Always record a baseline before setting a target.** A target invented without one is either trivially met or demoralising, and you can't tell which in advance.

**Accuracy floor (≥85%) before any speed target.** Speed at 60% accuracy is guessing quickly.

Run it: state the target aloud, time the whole set (never per-item — that induces the anxiety that destroys fluency), score after with no mid-set feedback, record the run, and **say the delta out loud.** Visible improvement is the entire emotional payload of this format.

**Fluency counts only when the target is hit on a *later* day.** Then mark `practice` in the aspect matrix and **retire the drill** — a drill kept past fluency trains the learner to associate sessions with busywork.

## Published decks

For review between sessions, publish the deck as an Artifact — flip, grade, and progress held in page state so practice doesn't require starting Claude.

Before building one, **load the `artifact-capabilities` skill** to check what persistence this account has, then design per `artifact-design`.

`deck.md` remains the source of truth. Reconcile anything reviewed in the page back into it at the next checkpoint.

## Where drills belong in a session

A drill on an already-established node is a near-guaranteed win that produces a visibly improved number — which makes it the natural **session closer** (`pedagogy/calibration-and-affect.md`). Use it to satisfy "never end on a miss."

Due cards are reviewed at **session start**, before new material. It takes minutes and is the single highest-leverage habit in the system.
