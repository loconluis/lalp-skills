---
name: lalp-investigate
description: Read-only investigation playbook — answer "how does X work", "why was Y built this way", or "are we sure about Z" without changing code, producing an evidence-backed map — entry points, data flow, owners, sharp edges. Loaded by lalp; usable directly for research questions.
---

> **Resolving skill references**: skills named below are sibling skills. To load one, `read` its `SKILL.md` from the same directory this skill lives in (e.g. if this file is `~/.agents/skills/lalp-feature/SKILL.md`, then `lalp-grill` is at `~/.agents/skills/lalp-grill/SKILL.md`).

# Playbook: Investigate

Read-only. You change no code; you produce a map someone can act on. If the answer turns out to require changes, report and hand off to `lalp-feature` / `lalp-bugfix` — don't drift into editing.

## 1. Frame the question

Restate it in one sentence. Name what would falsify each candidate answer before looking — a question you can't be wrong about isn't worth investigating.

## 2. Trace from the outside in

Follow the `lalp-understand` discipline:

- **Entry point** — where execution, the user, or the data enters.
- **Consumers and owners** — who renders/reads this, who owns the state.
- **Data flow** — where it originates, where it transforms, where it lands.
- **Sharp edges** — race conditions, implicit coupling, dead paths, lies the names tell.

Trace the real path: run the code, read the actual files. Don't infer from names or prior projects.

## 3. Evidence per claim

Every claim in the final map cites a `file:line`, a command output, or a log. Anything unverified is labeled a **hypothesis** — visibly, not in a footnote.

## 4. Answer with a map

- The answer in one paragraph, up front.
- The map: flow, owners, edges.
- Confidence per claim, and what would raise it.
- Follow-ups worth doing, ranked by value.

The person needs to *understand* the system, not just get the answer? Run the findings through `lalp-teach` — one plain account of what, how, and why.

## Non-negotiable

No code changes during investigation. If a quick edit would answer faster, note it as a proposed experiment instead of making it.
