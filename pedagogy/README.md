# Pedagogy Core

The method. Model-agnostic, executable by any orchestrator — Gemini, Antigravity, OpenAI-compatible, or Claude.

Everything in `agents/` and `.claude/` is a *binding* of this spec to a particular runtime. The spec itself depends on no provider, no tool name, and no file format outside this directory.

## Why this exists

Before this directory, the method lived in transcripts. `agents/socratic-tutor-agent.yaml` specified five behaviours in 39 words, while the actual teaching that produced the learner's best sessions — trap-sequence probing, state-equivalence detours, mirror-image error taxonomy — was never written down anywhere. It happened, it worked, and it could not be relied on to happen again.

A method that only exists in its own output is not a method. This is the method.

## The files

| File | Answers |
|---|---|
| `teaching-method.md` | *How* to teach. The two principles and the per-node loop. |
| `learning-aspects.md` | *What* "learned" means. Four aspects, four kinds of evidence. |
| `calibration-and-affect.md` | *How hard*, and *how it should feel*. Edge-bracketing and the difficulty band. |
| `session-shape.md` | *When*. The phase order of a single session. |
| `formats/` | *In what form*. One file per format — `exposition.md` builds a node; the rest confirm it. |

## How they compose

```
session-shape.md          ← the container: probe → plan → teach → checkpoint
  ├── calibration…        ← governs the probe, and difficulty throughout
  ├── teaching-method.md  ← governs the teach phase, node by node
  │     └── formats/      ← the concrete artifacts each node produces
  └── learning-aspects.md ← governs what counts as done, and so what to do next
```

Read `teaching-method.md` first. The rest modifies it.

## Provenance

The two teaching principles and the edge-bracketing protocol are ported from Amos Blomqvist's `learn` system (https://github.com/amosblomqvist/learn), a pi configuration. Its pedagogy is reproduced here with the personal framing generalised; its TypeScript extensions are not portable and were reimplemented against each target runtime instead.

The four learning aspects, the affect model, and the multi-format registry are extensions to it.

What the reference system lacked entirely was persistence — its carefully located "edge" was re-derived from scratch every session and discarded at the end. `learner_records/` is the answer to that, and is the reason this spec repeatedly instructs you to *write things down*.
