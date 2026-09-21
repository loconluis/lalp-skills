---
name: lalp-intent-first
description: Principle — no code without an approved intent. The spec owns why and what must be observably true; the diff owns how. Every change is traceable to a named acceptance criterion, and a discovered deviation updates the spec before it updates the code.
---

> **Resolving skill references**: skills named below are sibling skills. To load one, `read` its `SKILL.md` from the same directory this skill lives in (e.g. if this file is `~/.agents/skills/lalp-feature/SKILL.md`, then `lalp-grill` is at `~/.agents/skills/lalp-grill/SKILL.md`).

# intent-first

Intent Specs Driven Development in one rule: the intent is captured, approved as a spec, and everything after — tickets, code, review, shipping — is traced against it.

Rules:

- **Intent before interface, spec before code.** If you can't state the intent in one paragraph a stranger would understand, you're not ready to code. (`lalp-intent-spec`)
- **The spec owns why and what; the diff owns how.** Implementation detail in a spec is a smell; untraced hunks in a diff are a finding.
- **Approval gates implementation.** A skipped gate is the user's named decision, never the agent's.
- **Trace everything.** Every ticket cites criteria by name; every review checks them criterion by criterion; ship walks them with evidence.
- **Deviations reopen the spec.** When implementation proves the spec wrong, update the spec and re-approve — then change the code. Silent drift is how specs die.
- **The spec outlives the PR.** It is the decision record the next reader loads first. Keep it true, dated, and short.
