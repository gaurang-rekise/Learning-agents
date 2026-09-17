# Learning Agents

A model-agnostic AI learning system. It collects resources, finds the edge of what you know, teaches so things lock in rather than rot, drills them to fluency, and keeps a persistent record so each session continues the last one instead of restarting it.

Works with Claude, Gemini, Google Antigravity, and OpenAI-compatible agents.

## The idea

Two brains can hold the same propositions and look identical from outside. One holds a pile of **disconnected lone facts**. The other holds a few **core truths** from which those facts are derivable, so to it they are obviously connected.

That connection *is* understanding — and it's the only kind that survives. Memorized facts rot. Understood facts don't.

Everything here exists to build that dependency graph in the learner's head: foundational truths as the **nodes**, motivated derivations as the **edges**.

## What's in it

| Path | What it is |
|---|---|
| [`pedagogy/`](pedagogy/) | **The method.** Start here. Model-agnostic — no provider, no tool names. |
| [`agents/`](agents/) | Nine specialist agents as YAML. Bindings of the method. |
| [`prompts/orchestrator.md`](prompts/orchestrator.md) | Routing and the five-phase session lifecycle. |
| [`learner_records/TEMPLATES/`](learner_records/) | Blank scaffolds. Your actual records live in your own workspace, not here. |
| [`.claude/`](.claude/) | Claude Code native runtime — skills, subagents, commands, hooks. |
| [`install/`](install/) | Install the pack into any supported workspace. |

## The method, briefly

**Four aspects.** "Learned it" isn't one thing. Every node is tracked across *discovery* (why does this exist?), *understanding* (how does it hang together?), *practice* (can I do it fast?), and *application* (when does it matter?). A node is mastered only when all four carry evidence — which is how the system can honestly say "understands it completely on paper, has never built one."

**Calibrated difficulty.** Too much failure discourages; too little challenge bores. The system locates the *edge* of what you know — bracketed by both something you get right and something you don't — then holds a 70–85% success band, escalating sharply when you're coasting and backing off after two consecutive misses.

**Quizzes as instruments.** Every wrong option is a real misconception, so *which* wrong answer you pick is a diagnosis. Every quiz carries an explicit "I don't know" that is never graded wrong — without it you guess, and a lucky guess is recorded as knowledge you don't have.

**Multiple formats.** Quizzes confirm understanding. Flashcards make facts instant. Speed drills make procedures fluent. Explanation exercises prove the model is real. Labs and transfer tasks prove it survives contact with a problem nobody labelled.

**Persistence.** Sessions end with a written log whose last section is an executable script for the next session's opening move.

## Getting started

**This repo is the system, not a workspace.** Install it where you want to learn — one directory per topic:

```bash
mkdir -p ~/learning/digital-electronics
install/install_claude.sh --target ~/learning/digital-electronics
```

Then work *there*:

```bash
/teach                 # start or continue a session
/review                # flashcards and drills due today
/checkpoint            # write the session log and sync records
```

Keeping the two apart matters. Your course stays out of the system's git history, each topic gets its own records, and the hooks can tell a lesson from a code change — they could not when both lived in one directory.

Reinstall any time to pick up system updates; the pack is refreshed and your records are never touched.

With any other agent: point it at [`prompts/orchestrator.md`](prompts/orchestrator.md), then give it a learner request — topic, target outcome, current level, time budget.

## Install into another workspace

```bash
install/install_claude.sh      --target /path/to/workspace
install/install_gemini.sh      --target /path/to/workspace
install/install_openai.sh      --target /path/to/workspace
install/install_antigravity.sh --target /path/to/workspace
install/install_learning_agents.sh --provider all --target /path/to/workspace
```

Creates `.learning-agents/` with the pack, seeds a blank `learner_records/`, and writes the right context files for the provider. Existing learner records are never overwritten. See [`install/README.md`](install/README.md).

## Example

[`examples/fsm-sequence-detector-session.md`](examples/fsm-sequence-detector-session.md) — a real session traced end to end, including the misconception that was caught and how.

[`examples/python-beginner-to-job-ready.md`](examples/python-beginner-to-job-ready.md) — a curriculum-design flow.

## Credit

The two teaching principles and the edge-bracketing protocol are ported from [amosblomqvist/learn](https://github.com/amosblomqvist/learn), a pi configuration, with the personal framing generalised. The four learning aspects, the affect model, the multi-format registry, and the entire persistence layer are additions.
