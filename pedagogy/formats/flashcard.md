# Format: Flashcard

| | |
|---|---|
| **Serves** | Practice (facts, definitions, values, correspondences) |
| **Surface** | `learner_records/deck.md` (source of truth) + a published deck page for review |
| **Used by** | Phase 0 due-card review; Phase 4 card creation |

## What flashcards are for — and what they are not for

Flashcards are for the **facts that must be instant**: the ones that, if re-derived every time, become a permanent bottleneck on everything built above them.

A learner who must reconstruct a D flip-flop's characteristic equation from first principles every single time *understands* it and cannot *use* it. The derivation belongs to understanding; the instant recall belongs to practice. Both are needed, and cards only ever deliver the second.

**Never drill an unestablished node.** A card made before the concept is understood produces exactly the memorized-and-rotting knowledge this whole method exists to prevent. A card is a *consolidation* of understanding already built, never a substitute for building it.

Good candidates:

| Type | Example |
|---|---|
| Definition | setup time (t_su) → minimum time data must be stable *before* the clock edge |
| Correspondence | `S2` in the 1-0-1 detector → "seen 1, then 0" |
| Value / threshold | CMOS logic-high threshold → typically 0.7 × V_DD |
| Symbol | the `⌐` notation on a K-map axis → that variable is complemented |
| Procedure step-order | K-map simplification → group the 1s, largest power-of-2 groups first, wrap edges |

Bad candidates: anything the learner should be *deriving*; anything with a caveat in the answer; anything that is really three facts wearing a trenchcoat.

---

## Card schema

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

| Field | Purpose |
|---|---|
| `card-id` | stable kebab-case handle; referenced from `mastery.md` |
| `Front` / `Back` | one fact, one direction |
| `Node` | which node in the aspect matrix this card serves |
| `Due` | next review date |
| `Interval` | current spacing in days |
| `Ease` | difficulty multiplier, starts at 2.5 |
| `History` | dated grade log |

### Card-writing rules

**One fact per card.** If the back has an "and" joining two independent facts, it is two cards.

**The front must be answerable without the deck's context.** "What does S2 mean?" is ambiguous across topics; "In the 1-0-1 detector, what does S2 mean?" is not.

**No caveats on the back.** A back that needs "well, usually…" is a node that hasn't reached understanding yet. Send it back to `teaching-method.md`, not to the deck.

**Write the card in the learner's own words where possible.** Cards seeded from a phrase the learner themselves produced during a session are recalled measurably better than cards phrased by the teacher.

---

## Scheduling (SM-2)

Four grades, applied on review:

| Grade | Meaning | Effect |
|---|---|---|
| **Again** | failed to recall | interval → 1 day; ease − 0.20 |
| **Hard** | recalled with real effort | interval × 1.2; ease − 0.15 |
| **Good** | recalled correctly | interval × ease |
| **Easy** | instant, effortless | interval × ease × 1.3; ease + 0.15 |

Ease floors at 1.3. New cards start at interval 1d, ease 2.5; first Good → 6d.

**A card graded Again three times running is not a card problem — it is a node problem.** Stop drilling it, remove it from rotation, and send the underlying node back through the teaching loop. Repeated failure on a card almost always means the concept beneath it was never actually established, and no amount of repetition will fix that. Note it in the misconception log.

---

## Review flow

**In Phase 0**, cards due today are surfaced at session start and reviewed before new material. This takes minutes and is the single highest-leverage habit in the system.

**Between sessions**, the deck is also available as a standalone review page, so practice can happen without starting a full session. Whatever is reviewed there is reconciled back into `deck.md` at the next Phase 4.

`deck.md` is the source of truth. Any hosted surface is a view of it.

---

## Relationship to quizzes

They look similar and do different jobs:

| | Quiz | Flashcard |
|---|---|---|
| Measures | understanding | retention |
| Options | multiple, diagnostic | none — free recall |
| Purpose | locate the edge, confirm a node | keep an established fact instant |
| Timing | during teaching | spaced, after teaching |
| Failure means | the node isn't solid → repair it | the fact is fading → review sooner |

A missed quiz sends you back to the teaching loop. A missed card just reschedules — **unless** it keeps missing, at which point it was a quiz-level problem all along.
