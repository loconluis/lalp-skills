---
name: lalp-ship
description: Playbook for landing work — independently verify the full change on the real artifact (a green build is never proof), fresh-context review, honest commit and PR messages, land, watch CI, and report what shipped with evidence. Loaded by lalp; the exit stage of most playbooks.
disable-model-invocation: true
---

# Playbook: Ship

Landing is a verification step, not a formality. Everything before this was rehearsal.

## 1. Verify independently

Run the artifact the way a user would: build it, walk the acceptance criteria one by one, re-run the original reproduction for bugfixes. `../../disciplines/prove-it-works/SKILL.md` — the evidence must match what changed. A green build alone never ships anything.

## 2. Fresh-eyes review

A subagent that never saw the implementation reviews the diff. Two axes: **Standards** (repo conventions, common defects) and **Spec** (acceptance criteria). Findings get fixed and re-verified; structural fixes get re-reviewed.

## 3. Clean the landing

- The diff is what the task says it is — drive-by changes split out or dropped.
- Commit message: what and why, imperative, no filler — written through `../../disciplines/unslop/SKILL.md`.
- PR description: problem, approach, evidence (test output, screenshots for UI), and a rollback note for risky changes — same treatment.

## 4. Land and watch

Merge or land, then watch CI to green. A flake gets rerun once, then investigated — never blanket-ignored.

## 5. Report

What shipped, with evidence. Follow-ups discovered along the way get filed, not silently kept.

## Non-negotiable

No landing while any acceptance criterion is unverified. No "CI was green earlier."
