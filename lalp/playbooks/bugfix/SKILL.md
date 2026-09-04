---
name: lalp-bugfix
description: Playbook for bugs — reproduce on the real artifact first, capture the reproduction as a failing test when feasible, prove the root cause with runtime evidence before changing anything, fix the mechanism with the smallest change, re-verify the original reproduction, and sweep for nearby instances. Loaded by lalp.
disable-model-invocation: true
---

# Playbook: Bug fix

Follows `../../principles/root-cause/SKILL.md` end to end: reproduce → cause → mechanism → evidence.

## 1. Reproduce first — or don't fix

Reproduce on the real artifact: run it — real UI, real CLI, real request. Write the exact steps down. Can't reproduce? Gather evidence from the user (steps, logs, environment) and stop until you can. "I don't know why it happens" is not a starting point.

## 2. Capture the reproduction

When feasible, encode the reproduction as a failing test (`../../disciplines/tdd/SKILL.md`, red). Feasibility is named, not assumed — some bugs only reproduce against live systems, and that's a fact to record, not a step to skip silently.

## 3. Prove the cause

Form hypotheses. Rule them out with runtime evidence — logs, debugger, traces, print-and-look. Exactly one cause stands **proven**, not guessed. Ask why until you reach the mechanism, not the symptom's neighborhood.

## 4. Fix the mechanism, smallest change

`../../principles/smallest-change/SKILL.md`. No nil-guards that silence the crash. No retry loop wrapped around a broken thing. The fix removes the cause; it doesn't sedate the symptom.

## 5. Re-verify the original reproduction

The exact steps from step 1 now pass, on the real artifact. The regression test is green. Both, not one.

## 6. Sweep nearby

Same pattern elsewhere? Same class of bug adjacent? Check the neighborhood; fix or file what you find.

## Non-negotiable

No fix without a proven cause. No "works on my machine" — evidence, or it didn't happen.
