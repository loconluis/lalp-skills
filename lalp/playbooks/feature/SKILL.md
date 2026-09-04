---
name: lalp-feature
description: Playbook for building new behavior end to end — the main flow. Shape the idea, align only if ambiguous, write the intent spec and get approval, ticket large work, implement with TDD at the seams, review with fresh context, and ship with evidence. Loaded by lalp; the spine for anything that adds behavior.
disable-model-invocation: true
---

# Playbook: Feature

The main flow: shape → align → intent spec → plan → implement → review → ship. Enter at the stage the task actually needs; don't run stages for ceremony.

## 1. Shape (minutes, not hours)

Sketch: what changes for whom, the rough approach, the open questions. If it's obviously not worth doing — or the answer already exists — say so and stop. The cheapest feature is the one you don't build.

## 2. Align (conditional)

Real ambiguity — conflicting goals, unknown boundaries, taste decisions — gets `../../disciplines/grill/SKILL.md` (one question at a time until the design tree is resolved). Most requests don't: the spec's grounding questions are enough. Skipping is a named decision.

## 3. Intent spec — the gate

`../../disciplines/intent-spec/SKILL.md`: intent, observable contract, acceptance criteria, out of scope — written to `specs/<name>.md`. **No implementation before explicit approval**; a skip on small, obvious changes is the user's named decision, never the agent's. From approval on, this is Intent Specs Driven Development: every ticket cites a criterion by name, review checks them one by one, ship walks them with evidence — and a discovered deviation updates the spec before it updates the code.

## 4. Plan (conditional)

Multiple sessions, many moving parts → `../../disciplines/tickets/SKILL.md`. First ticket is a tracer bullet through the whole stack; the rest thicken it. Each ticket sized to one focused session.

## 5. Implement

- `../../disciplines/understand/SKILL.md` first if the area is unfamiliar — map before editing.
- Design worth settling first (new module, ownership move, several defensible shapes)? `../../disciplines/architect/SKILL.md` — sketch twice, synthesize, implement against the sketch.
- `../../disciplines/tdd/SKILL.md` at the seams: one vertical slice at a time, failing test first.
- `../../principles/smallest-change/SKILL.md`: the least code that meets the contract.
- One decision-log line per named decision (what, why, evidence).

## 6. Review

Fresh-context review in a subagent that never saw the implementation. Two axes: **Standards** (repo conventions, common defects) and **Spec** (the acceptance criteria, criterion by criterion — `../../disciplines/code-review/SKILL.md`). Findings get fixed; fixes that changed structure get re-reviewed.

## 7. Ship

`../ship/SKILL.md` — independent verification, then land.

## Non-negotiable

Approved spec before code, or the skip is named by the user. Tests come with the code, never "later". No landing without evidence.
