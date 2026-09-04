---
name: lalp-prototype
description: Playbook for settling design forks cheaply — build throwaway sketches to observe the trade-off, run N parallel attempts (arena) when the fork is empirical, compare side by side against the named question, decide with evidence, then delete the losers. Loaded by lalp; prototypes never ship.
disable-model-invocation: true
---

# Playbook: Prototype

A prototype exists to answer one question and then die. Exhaust the design space before committing — 2-3 competing sketches beat one confident guess.

## 1. Name the question

One decision this prototype settles, written as a question with observable answers: "does the virtualized list hold 60fps at 10k rows?", "is the shell-script setup actually simpler than the Makefile?"

## 2. Cheapest artifact that answers it

Timeboxed. In a scratch directory or worktree. No polish, no edge cases, no tests — it's an experiment, not a product. If it takes a day, the question was too big: split it.

## 3. Arena for empirical forks

Genuinely uncertain? N parallel attempts via subagents — one per approach, same question. Different strategies and models welcome. The comparison is the point; effort per attempt stays small. A *design* fork (shape, not data) goes to `../../disciplines/architect/SKILL.md` Phase B instead — the arena for shapes.

## 4. Compare and decide

Side by side, against the named question — not vibes. The decision and its evidence go into the decision log. Losing code gets deleted.

## 5. Clean up

Scratch dirs removed, branches deleted. What survives is the **decision + evidence**, not code.

## Non-negotiable

Prototypes don't get "improved into production". Production work starts fresh through `../feature/SKILL.md`, carrying what was learned.
