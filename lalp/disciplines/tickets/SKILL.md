---
name: lalp-tickets
description: Split an approved intent spec into tracer-bullet tickets, each citing the acceptance criteria it satisfies by name and declaring its blocking edges — for work that spans multiple sessions, multiple PRs, or many moving parts, or when the user asks to break a plan into tickets. Tickets implement in dependency order with TDD per ticket.
disable-model-invocation: true
---

# Discipline: Tickets

Turn an approved intent spec (or a plan, or a conversation) into units of work you can implement, review, and land one at a time.

## 1. Tracer bullet first

The first ticket is the smallest end-to-end slice: it walks the whole loop — surface to storage and back — on the happy path, even if ugly. It proves the plumbing before depth.

## 2. Split the rest

Each remaining ticket is one independently shippable unit:

- **Goal** — one sentence, in the spec's terms.
- **Files** — the expected touch points (an estimate; reality wins).
- **Blocking edges** — which tickets must land before this one.
- **Acceptance** — the named criteria from the spec this ticket satisfies (`A1`, `A2`, …). No orphan tickets: every criterion belongs to some ticket, and the tickets say which.

## 3. Declare dependencies

Every ticket declares its blocking edges. No ticket depends on work it doesn't list. The sequence is a DAG, not a list.

## 4. Write them down

Save to `specs/<name>.tickets.md` in the project. One ticket per H2, one blocking edge per line.

## 5. Hand off

Implementation runs one ticket at a time through the task playbook (`../../playbooks/feature/SKILL.md`, `../../playbooks/bugfix/SKILL.md`) with `../tdd/SKILL.md` per ticket, and `../code-review/SKILL.md` before each commit. Finish line: every acceptance criterion from the spec is satisfied by some ticket.
