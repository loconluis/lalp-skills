---
name: lalp-architect
description: Discipline — sketch the shape before the code. Ground the systems the change touches, design at least two structurally distinct candidates, synthesize one sketch, implement against it, and scrap the sketch when repeated friction proves it wrong. Loaded after the intent spec gate when the design deserves it, or for prototype design forks.
---

> **Resolving skill references**: skills named below are sibling skills. To load one, `read` its `SKILL.md` from the same directory this skill lives in (e.g. if this file is `~/.agents/skills/lalp-feature/SKILL.md`, then `lalp-grill` is at `~/.agents/skills/lalp-grill/SKILL.md`).

# Discipline: Architect

Sketch the shape before the code, then stay in the loop while implementation fills it in. Use when jumping straight to code would lock in the wrong shape — new modules, ownership moves, anything with more than one defensible design.

Division of labor: the intent spec (`lalp-intent-spec`) owns **why and what**; the sketch owns **the shape**. Architect runs after the spec gate.

Open the work plan with one entry per phase before starting, so phases can't silently disappear:

1. Ground
2. Sketch
3. Agree (opt-in)
4. Implement
5. Scrap

## Phase A — Ground

Build a real mental model of every system the change touches: `lalp-understand` maps (entry, data, state, edges). Naming a file isn't grounding. If the design redefines ownership or layering, read the git history of the current shape so the old rationale becomes a constraint, not a guess. Skip only for genuinely greenfield work with no surrounding system.

## Phase B — Sketch

**Design it twice.** At least two structurally distinct candidates — whole-shape alternatives, not point fixes inside one shape. Host subagents? Run the candidates as an arena (mode §Parallelism patterns). No subagents? Sketch both yourself — the constraint is two shapes, not two agents.

Each candidate is a design package, **caller's usage written first**, then the type sketch, function signatures, module map, and a one-paragraph rationale. Screen every candidate against red flags before synthesis:

- shallow modules — one caller, one reason to exist
- information leakage across module boundaries
- temporal decomposition — split by *when* code runs, not by *what* it owns
- pass-through methods that add a layer and nothing else

Prefer the design that hides more complexity behind a smaller public surface. Synthesize into one sketch and record the synthesis decision — what was taken from each candidate, and why.

## Phase C — Agree (opt-in)

Default: proceed to implementation, no checkpoint. The user opts in ("with checkpoint", "show me before implementing") → surface the sketch and pause for sign-off. The sketch can land as its own commit (scaffold first — `not implemented` bodies), so fill-in commits read against a stable contract. If the user pushes back on the shape, that is Phase A evidence: re-ground, re-sketch.

## Phase D — Implement against the sketch

Replace `not implemented` bodies with code. The sketch is the contract. Deviations are signal, not friction to absorb: a parameter the sketch didn't anticipate means the sketch was wrong, the spec missed a requirement — reopen the spec (`lalp-intent-first`) — or the implementation is overreaching. Surface it; don't bolt it on.

## Phase E — Scrap when the shape is wrong

The trigger is a **pattern**, not single instances:

- the same shape of workaround reappearing across unrelated code
- unrelated edge cases that all need special-case branches
- types needing escape hatches (`any`, casts, optionals always set) to compile
- callers having to know the abstraction's internal rules to use it
- two or more same-shape Phase D deviations

Use judgment: a few hard cases don't condemn a design, and complexity in the data is not complexity in the shape. When you scrap — re-map what's been built (the lessons are inputs, not vibes), redesign as if the new constraints had been day-one assumptions, subtract before adding (the new sketch gets smaller before it grows), and return to Phase B.

## Output

`specs/<name>.sketch.md` — usage sketch first, types and signatures, module map, rationale + synthesis decision. It dies with the feature or lives on as its ADR.
