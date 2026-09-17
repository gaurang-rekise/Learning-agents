# Format: Quiz

| | |
|---|---|
| **Serves** | Understanding (confirmation), and diagnosis at every phase |
| **Surface** | Terminal — an interactive popup with options |
| **Used by** | Phase 1a probing, Phase 3 quiz-check, Phase 0 misconception re-tests |

A quiz is not an assessment. **It is the measuring instrument the whole method runs on** — the edge in `calibration-and-affect.md` is located with quizzes, the difficulty band is measured with quizzes, and every node in the teaching loop is confirmed with a quiz.

An instrument that gives wrong readings is worse than no instrument. Most of this file is about that.

A quiz confirms that a node landed; it never makes it land. The format that does is `exposition.md`, and every expository stretch ends in one of these.

---

## Schema

| Field | Required | Notes |
|---|---|---|
| `question` | ✅ | **Exactly one question per quiz.** |
| `details` | — | Extra context shown under the question |
| `options` | ✅ min 2 | Each `{label, value?, description?}`; `value` defaults to `label` |
| `correctAnswer` | ✅ | The option **value**, or array of values for multi-select |
| `explanation` | ✅ | Revealed only *after* answering |
| `multiSelect` | — | Grading is exact-set-match |
| `shuffle` | — | **Defaults true** |

### Two schema rules that prevent silent corruption

**`correctAnswer` is keyed by option *value*, never by position.** This is self-checking and prevents miscounting. It also means options can be safely shuffled for display: indices are resolved *after* shuffling, so grading always matches what the learner actually saw. A `correctAnswer` matching no option must be a hard error, never a silent mis-grade.

**`explanation` is required, and never rendered before the answer.** It carries all the reasoning. Nothing in the question or options may leak it.

---

## The "I don't know" option

**Every quiz carries an explicit "I don't know" option.** It is not a real option:

- it never participates in shuffling
- it has no correct-answer value
- it produces a **distinct signal**, not a right/wrong grade

An honest "I don't know" must never be confused with a lucky or unlucky guess.

Without it, the learner guesses, and a lucky guess is recorded as knowledge that isn't there. That corrupts the success-rate window, which corrupts every difficulty decision downstream. **The opt-out is what makes the measurement mean anything.**

When it comes back: treat it as a genuine knowledge gap to teach into, **not** as a wrong answer. Exclude the item from the success-rate window — it is information about coverage, not about difficulty. Show the correct answer and the explanation as usual, but with no ✗.

Never write your own uncertainty option into `options`. There is exactly one, and it is added automatically.

---

## Distractors are instrumentation

Treat each wrong option as a **diagnostic probe, not filler.**

Make it a specific, believable mistake the learner might actually hold — a common misconception, or an adjacent easily-confused concept — so that **which** wrong answer they pick reveals **which** nuance of their understanding is off.

You learn far more from a targeted wrong choice than from a binary right/wrong. A quiz whose distractors are throwaway noise returns one bit. A quiz whose distractors are real competing models returns a diagnosis.

Each distractor must be:
- a real error the learner might actually make (so the choice is diagnostic), **and**
- unambiguously wrong on the intended reading

**Tempting, not tricky.**

---

## The option-construction procedure

The rule "keep the options even" is not enough on its own, because it is a **post-hoc audit** — you write a good answer plus some throwaway wrongs, then don't re-scrutinise them. The tell is baked in before any check runs.

So don't audit afterwards. **Build the options so evenness is automatic:**

### 1. Every option is a bare claim — no justification anywhere

The number-one giveaway is the correct option carrying its own reasoning — *"…, because it preserves the live progress"* — while the distractors are bare.

Put **zero** "why" in any option. All reasoning goes in `explanation`, which only appears after they answer.

### 2. Write the correct claim first, then mutate it into each distractor

Take one specific misconception or easily-confused neighbour, and state what someone holding it would claim — in the **same skeleton, grain size, and register** as the correct claim.

Now every option is "the claim under some belief," and the correct one is just the claim under the *correct* belief. Parallelism falls out by construction instead of being policed.

### 3. Keep every distractor a real, wrong-on-the-intended-reading error

See above. Tempting, not tricky.

### 4. No asymmetric formatting

Don't bold the key concept in one option and not the others. Don't make one longer, more precise, more hedged, or the only one in the right format. Anti-guessing hygiene: the correct answer must not stand out **by form**.

### The test

**If, reading the finished set cold, you can still tell which is right without knowing the material, you skipped step 1 or 2. Regenerate — don't patch.**

---

## Worked example

The learner's session 3 produced a real misconception: the instinct that `S3 --0-->` should go to `S0`, discarding live progress.

**Bad** — the tell is unmissable:

```
Why does S3 --0--> go to S2?
  ▸ Because the 0 that arrives is itself the start of a potential new 1-0-1,
    so discarding it would miss overlapping occurrences like 10101
  ▸ Because S0 is the start state
  ▸ Because the FSM resets
```

Option 1 is three times longer and carries its own proof. Anyone can pick it without knowing what an FSM is.

**Good** — same claim, mutated:

```
After firing on 101, the next input is 0. Which state?
  ▸ S2 — the 1 just seen still counts as progress
  ▸ S0 — firing consumes the match, so progress resets
  ▸ S1 — the 0 is discarded and the machine waits for a fresh 1
  ▸ I don't know
```

Every option is a bare claim in the same skeleton: *state — what happens to progress*. Option 2 is the learner's actual documented misconception. Option 3 is a different plausible error (confusing "discard the input" with "discard the state"). Which one they pick tells you which model they hold.

---

## Usage rules

**One question per quiz.** To probe nuance, ask several quick questions and adapt each one based on the previous answers — never one giant caveated question. This is the whole mechanism by which Phase 1a binary-searches the edge.

**Gradable-and-Socratic is normal.** If a question has a definite right answer, it is a quiz even when the learner is "attempting the discovery" and even when you pose it open-endedly first. Reserve open questions for genuine no-right-answer forks.

**Quiz the foundations too.** An unconfirmed unconditional truth is exactly as dangerous as an unconfirmed derived fact.

**Never leak the answer before it is given.** Not in the question, not in an option, not in the transcript, not in a log written before the answer arrives.

---

## Logging

Every quiz result goes to `learner_records/mastery.md`:

```
| date | node | result | picked | note |
|---|---|---|---|---|
| 2026-09-17 | fsm-overlap-transitions | ✓ | S2 | — |
| 2026-09-17 | dff-setup-time | dontknow | — | "no idea what t_su is" |
| 2026-09-17 | kmap-adjacency | ✗ | wrapped edges don't count | classic adjacency misconception |
```

Three distinct outcomes: `✓`, `✗`, `dontknow`. Collapsing the third into the second destroys the calibration signal.

A `✗` whose picked option was a known misconception opens or reinforces an entry in the misconception log, **with a re-test date.**
