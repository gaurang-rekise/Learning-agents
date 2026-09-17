# learner_records/

**This directory ships templates, not a course.**

A learner's actual records — profile, roadmap, mastery ledger, flashcard deck,
drills, session logs, resource lists — belong in *their own workspace*, not in
this repository. This repo is the system; a course is data.

Keeping the two together causes real problems, and did:

- the course ends up in the system's git history, so the repo cannot be shared
- `profile.md` and friends are single-topic, so a second subject has nowhere to go
- hooks cannot tell "I taught a lesson" from "I edited the repo", which made the
  checkpoint hook misfire on every turn of a session that only changed code

## Where records actually live

```bash
mkdir -p ~/learning/<topic>
install/install_claude.sh --target ~/learning/<topic>
```

That seeds `~/learning/<topic>/learner_records/` from `TEMPLATES/` and installs
the pack and runtime alongside it. Reinstalling later refreshes the pack and
**never** overwrites a record that already exists.

One workspace per topic. Run sessions there; fix the system here.

## TEMPLATES/

Blank scaffolds the installer copies into a fresh workspace. Editing these
changes what every future learner starts with — see `TEMPLATES/README.md`.
