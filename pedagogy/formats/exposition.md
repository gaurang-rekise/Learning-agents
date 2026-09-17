# Format: Exposition

| | |
|---|---|
| **Serves** | Discovery and Understanding — the delivery side of both |
| **Surface** | The lesson itself; worked examples archived to the session log |
| **Used by** | Phase 3, whenever the establish step is expository rather than Socratic |

## Why this format exists

Every other format in this directory checks whether something landed. **This is the one that makes it land.**

That gap was real and structural. The method named two modes — Socratic and expository — and funded only one: the Socratic path had a 157-line quiz spec, an option-construction procedure and a calibration band, while the expository path had a single sentence. So the moment the tutor chose exposition — which the method explicitly requires for material beyond cold-reasoning reach, or for a tired learner — it was improvising.

Discovery is learned the same way. A curiosity gap and a motivating problem are *delivered*, not elicited.

---

## When exposition beats Socratic

Default to Socratic. Reach for exposition when:

| Situation | Why |
|---|---|
| The idea could not be reasoned to cold | Nobody derives Gray-code ordering from first principles. Some things were *discovered* historically, not deduced. |
| The prerequisite chain is long | Socratic on step 7 when steps 1–6 are missing produces flailing, not discovery. |
| The learner is low-energy or short on time | Effortful discovery has a cost. Sometimes the right call is to deliver it well and quiz it after. |
| A misconception needs replacing, not probing | Once you know the wrong model, keep probing it and you are rubbing their nose in it. Show the correct one. |
| The learner asks for it | "Just tell me" is data. Honour it, then confirm with a quiz. |

**Exposition is not the lazy option.** Done well it carries more load than a Socratic exchange, because you are building the motivation *and* the derivation, with no answers from the learner to steer by.

---

## The shape of a motivated narration

Exposition that lands is not a summary delivered fluently. It has a shape, and the shape is Principle ii — *nothing appears from nowhere* — applied to a monologue.

**1. The problem, before the thing.**
Open with what goes wrong without this idea. Not "here is the D flip-flop" but "we need to remember a bit across a clock edge, and here is why a plain latch will not do it."

**2. The naive attempt, and its failure.**
Show the obvious approach and let it break. This is the single highest-value move in exposition: the failure *is* the motivation for everything that follows, and a learner who has seen it will never ask "why is it built this way?"

**3. The fix, as a response to that specific failure.**
Now the real idea arrives as the answer to a question the learner is already holding.

**4. The consequence.**
What this now lets us do that we could not before. Close the loop opened in step 1.

> 3Blue1Brown is the reference for this shape. The test: could the learner plausibly have reached for this move themselves, given what they knew a moment ago? If not, there is a missing step — find it.

**The failure mode is skipping to step 3.** It is faster, it feels efficient, and it produces exactly the arbitrary-seeming fact the brain refuses to commit to.

---

## Worked examples

The most robustly replicated result in instructional research, and absent from this system until now: **for a novice, studying a worked solution beats solving a problem.** Problem-solving consumes the working memory that learning needs, so a beginner grinding through an exercise often ends up with the answer and no transferable method.

### How to work an example

- **Show every step, including the ones you would normally skip.** The skipped step is usually exactly where the novice is stuck.
- **Narrate the choice, not just the move.** "Group the largest power-of-two block first" is a move. "Group the largest first *because* every cell you leave ungrouped costs another term" is a method.
- **Say what you considered and rejected.** Expert reasoning is mostly pruning, and it is invisible unless spoken.
- **Never present a clean path you did not actually take.** A polished solution that hides the dead ends teaches that experts do not have dead ends, which is both false and discouraging.

### The fade — this is not optional

The worked-example effect **reverses** as competence grows. Keep supplying full solutions to someone who no longer needs them and you suppress the retrieval that would consolidate the skill.

Fade deliberately:

```
full worked example  →  completion problem   →  faded example      →  solo
(you do all steps)      (last step is theirs)   (middle is theirs)   (all theirs)
```

Move a rung when the learner completes the current one unaided. If they stall, drop back a rung rather than explaining harder.

---

## Analogy

An analogy is a loan against the learner's existing knowledge, and **every analogy comes due.**

Session 1's light-switch analogy for state worked. Nothing recorded *why*, so it could not be reused — this section is that.

### Build it

- Map to something the learner **actually** knows, not something they have heard of.
- The mapping must carry the **mechanism**, not just the vibe. A light switch is a good analogy for state because it genuinely holds a value with no input present. "Memory is like a filing cabinet" carries nothing.
- One analogy per idea. Two analogies for the same concept produce two half-built models.

### Bound it — the part that is always skipped

**State where the analogy breaks, in the same breath that you introduce it.**

> "A light switch holds its position with nothing pressing on it — that is state. Where it stops: a switch changes the instant you flip it, and a flip-flop only changes on a clock edge. The timing is not part of the analogy."

An unbounded analogy does not fade politely. It becomes the misconception you spend the next session dislodging — and it will be *more* stubborn than an ordinary error, because you taught it.

### Retire it

Once the real mechanism is established, say plainly that the analogy has done its job and is now being set aside. Learners hold onto scaffolding indefinitely unless told it is scaffolding.

---

## The curiosity gap

`calibration-and-affect.md` requires opening on one. Here is how to build one.

A curiosity gap is **not** a teaser ("today we'll learn about flip-flops"). It is a question the learner wants the answer to *before* they know the answer exists.

The strongest form: **a question their current model answers confidently and wrongly.** Their own reasoning produces an answer; the trace contradicts it; the gap opens with real force. That is the surprise beat, and it is why the `10101` trap worked.

Weaker but still good, in order:

1. A concrete failure they would not have predicted
2. A number that seems impossible until explained
3. Two cases that look identical and behave differently
4. A thing they already use, whose mechanism they have never questioned

**A gap you open, you must close in the same session.** An unanswered opener trains the learner that your questions are rhetorical, and the next one will not land.

---

## Cognitive load — what to leave out

Exposition works *because* it removes load. An exposition that includes everything relevant has forfeited its only advantage over discovery.

- **One new idea at a time.** A second concurrent idea does not add 50% difficulty; it multiplies it, because the learner must hold both while relating them.
- **Cut every true-but-not-load-bearing caveat.** "Usually, though there are exceptions in asynchronous designs" costs more than it pays. Note it for later; a caveat delivered before the rule is understood attaches to nothing.
- **Concrete before abstract, always.** A specific 4-state detector before "finite state machines in general." The abstraction is *compression of examples*, and compressing one example is not possible.
- **Name things after you show them.** Terminology introduced before the thing it names is a second memory task competing with the first.

> If you are unsure whether to include something: leave it out. Anything genuinely needed will be missed, and can be added exactly where the gap appears — which is better placement than you would have guessed.

---

## Confirm it landed

Exposition is the one format with **no built-in feedback.** The learner said nothing, so you have no evidence.

Every expository stretch ends in a quiz-check. Non-negotiable — an unconfirmed expository node is the most dangerous kind, because fluent delivery feels like successful teaching to both parties.

If the check fails, **do not re-explain the same way, louder.** The explanation failed for a reason: a missing prerequisite, a broken analogy, or a step skipped between 2 and 3 above. Find which, and fix that.

---

## Logging

To the session log:

- which stretches were expository and why that call was made
- any worked example in full — it is reusable, and it is the best source of later drill items
- **every analogy used, with the boundary you stated.** An analogy whose limits were never voiced is a misconception with a delay fuse; record it so the next session can check whether it is being over-extended
- where an explanation failed a quiz-check, and what was actually missing
