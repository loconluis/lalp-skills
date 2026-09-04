---
name: lalp-smallest-change
description: Principle — write the least code that meets the contract. Prefer delete over modify, modify over add. No speculative APIs.
disable-model-invocation: true
---

# Principle: Smallest change

- Prefer **delete > modify > add**.
- Added code must be justified against the intent spec's contract; what's not justified doesn't get added.
- No speculative APIs "just in case": build only what the task requires.
- A small change gets reviewed, verified, and understood; a big one doesn't.
