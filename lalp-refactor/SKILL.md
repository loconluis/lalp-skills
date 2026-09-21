---
name: lalp-refactor
description: Playbook for behavior-preserving changes — pin the current contract with tests, name the target shape from first principles, move in small green steps, migrate all callers and delete the old path in the same wave, and prove behavior didn't change. Loaded by lalp.
---

> **Resolving skill references**: skills named below are sibling skills. To load one, `read` its `SKILL.md` from the same directory this skill lives in (e.g. if this file is `~/.agents/skills/lalp-feature/SKILL.md`, then `lalp-grill` is at `~/.agents/skills/lalp-grill/SKILL.md`).

# Playbook: Refactor

Same behavior, better shape. The contract is frozen (`lalp-preserve-behavior`): every deviation is either a named decision or a bug.

## 1. Pin the current behavior

Tests around the area first. Where coverage is missing, write characterization tests — asserting what the code *does* today, not what it should do. No refactor starts red.

## 2. Name the target shape

One paragraph: what the code should look like and why that shape pays — fewer layers, illegal states unrepresentable, one owner per concern. Design it as if the requirement had been foundational from day one, not as a patch bolted onto the old shape.

## 3. Sequence the moves

Small steps, each leaving the suite green: extract → move → invert, one commit-sized move at a time (`lalp-sequence-units`). Between moves, run the tests. Every time, no exceptions.

## 4. Migrate callers, then delete

All callers move to the new path and the old path is deleted **in the same wave**. No compatibility shim "for later" — later never comes. No `@deprecated` without a deletion date or ticket. If callers can't all move now, the migration isn't ready — say so instead of shimming.

## 5. Prove parity

Full suite green, plus behavior spot-checks on the real artifact where feasible (`lalp-prove-it-works`). Diff review: the change touches shape, not behavior — anything behavioral in the diff is named and justified.

## Non-negotiable

Green tests between every move. No half-migrated state lands.
