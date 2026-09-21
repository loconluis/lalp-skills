---
name: lalp-preserve-behavior
description: Principle — when changing existing behavior, the current contract is a constraint. Any deviation is a decision that must be named and approved.
---

> **Resolving skill references**: skills named below are sibling skills. To load one, `read` its `SKILL.md` from the same directory this skill lives in (e.g. if this file is `~/.agents/skills/lalp-feature/SKILL.md`, then `lalp-grill` is at `~/.agents/skills/lalp-grill/SKILL.md`).

# Principle: Preserve behavior

- When improving a flow, the current behavior is an implicit contract.
- Everything that changes gets named; everything preserved gets checked.
- An unnamed deviation from the contract is a bug the user will discover.
- The old contract belongs in the intent spec (lalp-intent-spec) as the preservation constraint.
