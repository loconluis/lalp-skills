---
name: lalp-grill
description: Alignment interview for genuinely ambiguous work — interview the user branch by branch until the design tree is resolved — behavior, states, priorities, boundaries, and the shared language used to describe them. Loaded when a request has deep ambiguity, or when the user asks to be grilled before work starts.
---

> **Resolving skill references**: skills named below are sibling skills. To load one, `read` its `SKILL.md` from the same directory this skill lives in (e.g. if this file is `~/.agents/skills/lalp-feature/SKILL.md`, then `lalp-grill` is at `~/.agents/skills/lalp-grill/SKILL.md`).

# Discipline: Grill (alignment interview)

Use before the intent spec when the request is genuinely ambiguous — conflicting priorities, unknown outcomes, unclear boundaries. For most requests, `lalp-intent-spec`'s grounding (2-3 sharp questions) is enough; this is the version you load when it isn't, or when the user asks for it.

## 1. Interview branch by branch

Resolve the design tree one branch at a time. For each open branch, ask the sharpest question that closes it:

- **Behavior** — what exactly happens when…?
- **States** — which states matter here (idle / running / empty / error / success)? What is observable in each?
- **Boundaries** — what is explicitly out of scope?
- **Priorities** — when two constraints conflict, which wins?
- **Preservation** — what existing behavior must not change?

One question per turn; the next question only when the branch is closed. Don't re-ask what was already answered.

## 2. Capture the shared language

As the user answers, note the terms they use for the domain. These become the vocabulary for the spec, the tickets, and the code. If a `CONTEXT.md` or glossary exists in the project, update it; if the terms keep recurring and there is none, offer to create one.

## 3. Hand off

Close with a one-paragraph summary of the resolved design and hand off to `lalp-intent-spec` — the spec now writes itself.
