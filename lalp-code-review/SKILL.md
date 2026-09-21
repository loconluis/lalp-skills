---
name: lalp-code-review
description: Two-axis review of a diff before it is committed — Standards (repo conventions and common defects) and Spec (does it satisfy the originating intent spec's acceptance criteria, criterion by criterion). Loaded when reviewing a diff, or as the closing step of an implementation playbook.
---

# Discipline: Code review

Two axes, reviewed separately so neither pollutes the other.

**Delegation (optional)**: if your host supports spawning subagents with isolated context, delegate each axis to a separate reviewer — each receives the diff plus its own axis only and returns the buckets below. Verdict synthesis stays with you. No such capability on your host? Run the axes in order yourself and keep the findings in separate buckets.

## Axis 1 — Standards

- Does it follow the repo's conventions (naming, structure, patterns)?
- Common defect smells: states that can't be represented, dead branches, duplicated logic, error paths that swallow, modules doing two jobs — and, where UI is touched, a11y regressions (keyboard path, focus, contrast, labels).
- Missing tests for the behavior it claims to add.

## Axis 2 — Spec

- Does the diff satisfy the originating intent spec's acceptance criteria, **criterion by criterion, traceable by name**?
- Does it touch anything outside the spec's scope? (Out-of-scope changes are findings, not gifts.)
- For bugfixes: does it fix only this bug, and does the regression test exist?

## Verdict

Report three buckets:

1. **Block — must fix before merge** (breaks behavior, violates the contract, unsafe).
2. **Should — fix now** (clear smell, missing test, convention break).
3. **Nit — optional** (only include if it reveals a bug or regression).

Never merge or commit silently. Findings loop back into the playbook that produced the diff; the fix goes through that playbook's verification, not a shortcut.
