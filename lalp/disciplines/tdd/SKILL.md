---
name: lalp-tdd
description: The implementer's methodology — test-driven development with a red-green-refactor loop, one vertical slice at a time. Build features or fix bugs one test at a time, writing the failing test for observable behavior first. Loaded when implementing any behavior change.
disable-model-invocation: true
---

# Discipline: TDD

The rate of feedback is your speed limit. Keep the loop short: one test, one implementation, repeat.

## The loop

1. **Red** — write a failing test for the next unit of observable behavior. One test per behavior; no skipping ahead.
2. **Green** — write the minimal implementation that passes it.
3. **Refactor** — clean up, keeping the test green.

Then the next slice.

## What makes a good test

- Asserts **observable behavior** the user or caller would notice (renders X, clicking does Y, the command prints Z, the endpoint returns 409) — not implementation details.
- Covers the **edge states** of the contract: loading, empty, error, success.
- Runs in the project's existing test setup — match the conventions you find.

## What makes a bad test

- Asserts internals (function names, exact markup, private helpers) — it breaks when you refactor, not when behavior breaks.
- Mocks everything, so it tests the mock, not the code.
- Is speculative — written for behavior nobody asked for.

## When TDD doesn't fit

Work with no observable-behavior seam — pure visual or layout changes — has nothing to test first: verify by looking instead (`../prove-it-works/SKILL.md`). The point is the feedback loop, not the dogma. When you skip a test, name why.

## Non-negotiable

No "fix everything, then write the tests at the end". Tests come first, one slice at a time — and the real-artifact verification (`../prove-it-works/SKILL.md`) still runs when the implementation is done.
