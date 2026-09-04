---
name: lalp-sequence-units
description: Principle — break work into small units that each end in a verifiable state, check each before starting the next, and order delivery so the sequence proves itself to a reviewer.
---

# sequence-units

A unit that can't be verified alone can't be trusted landed. Order work so each step's success makes the next one safer.

Rules:

- One unit = one verifiable end state (test green, artifact runs, evidence captured).
- Tracer bullet first: a thin slice through everything, then thicken.
- Verify each unit before starting the next; never stack unverifiable work.
- Land units as they verify — small PRs that prove themselves, not one big reveal.
