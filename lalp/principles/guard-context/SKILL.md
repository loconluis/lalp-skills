---
name: lalp-guard-context
description: Principle — the context window is a budget; spend it on decisions, not payloads. Route bulk reading and raw output to subagents; keep maps, summaries, and conclusions in the main thread.
---

# guard-context

Attention is the scarce resource. Past the smart zone (~140k tokens), quality degrades quietly — hallucinations creep in and earlier instructions lose their grip.

Rules:

- Bulk goes to subagents; summaries come back.
- A map beats a transcript: entry points, owners, edges — not full file dumps.
- Long work is spec + tickets, each unit inside one focused session.
- Reviews run in fresh context; the author's session is biased.
- Checkpoint state to files. Memory is not storage.
