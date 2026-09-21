---
name: lalp-overnight
description: Playbook for long autonomous runs — hours of unattended work ("I'm going to bed; land the stack"). Sequence verifiable units, checkpoint state to disk after each, never block on the absent human, land units as they verify, and leave an honest morning report. Loaded by lalp.
---

> **Resolving skill references**: skills named below are sibling skills. To load one, `read` its `SKILL.md` from the same directory this skill lives in (e.g. if this file is `~/.agents/skills/lalp-feature/SKILL.md`, then `lalp-grill` is at `~/.agents/skills/lalp-grill/SKILL.md`).

# Playbook: Overnight

Unattended hours. The unit of progress is a **verified unit on disk**, not a good feeling (`lalp-sequence-units`, `lalp-never-block`).

## 1. Slice the night

Before starting: the unit sequence — each unit independently verifiable, ordered so the sequence proves itself (tracer bullet first, then thicken). Written to disk, not held in mind.

## 2. State lives on disk

After every unit: a decision-log entry plus a state file — done / in-flight / next. A crash, a context reset, a takeover: all recover from disk (`paseo-handoff` shape). Memory is not storage.

## 3. Never block on the human

The operator is asleep.

- Ambiguity → conservative reading, named in the log, proceed.
- Reversible actions → act, log.
- Irreversible (deletes, publishes, force-pushes) → skip and queue for morning.
- Failure → retry once with a **changed approach**; still stuck → park the unit, log the handoff, next unit.

## 4. Verify each unit

Every unit ends with its own evidence on disk — tests, runs, screenshots — before the next begins. Green build ≠ proof (`lalp-prove-it-works`). A unit that can't be verified isn't done; it's blocked, and it goes in the report as such.

## 5. Land as you go

Verified units land immediately — commit or PR per unit, dependencies noted. No one giant morning dump where everything fails together.

## 6. Morning report

- What landed, with evidence.
- What's parked, why, and what unblocks it.
- Decisions taken unattended — the conservative calls made and their cost.
- Follow-ups worth a human's attention.

Honest and skimmable. Nothing buried.

## Non-negotiable

No destructive action while unattended. No unit marked done without evidence on disk.
