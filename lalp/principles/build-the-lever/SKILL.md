---
name: lalp-build-the-lever
description: Principle — for non-trivial repeated work, build the tool that does it or proves it (script, codemod, generator, skill) instead of working by hand. The tool is the artifact a reviewer can rerun.
---

# build-the-lever

Hand-work doesn't scale and doesn't review. A lever is deterministic, reviewable, re-runnable — and it's evidence the next person can regenerate.

Rules:

- N sites of the same change → codemod, not N edits.
- N runs of the same check → script it into the repo.
- N sessions of the same workflow → it becomes a skill or playbook.
- One-shot levers are fine; delete them after the sweep, or keep them named.
- The lever is written for the reviewer: boring diff, obvious behavior.
