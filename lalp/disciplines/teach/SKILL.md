---
name: lalp-teach
description: Discipline — explain what a thing is, how it works, and why it is built that way, in one plain account at the person's pace. Weaves the understand map and the git history into an explanation the person actually understands. Loaded when the goal is understanding, not change.
disable-model-invocation: true
---

# Discipline: Teach

**Explain what a thing is, how it works, and why it's built that way — one plain account, at the person's pace. The goal is that they understand it, not that anything changes.** For "teach me this", "help me really understand X", "explain this change or subsystem".

Teach sits above the map and the history: `../understand/SKILL.md` produces the *how*; git history, linked issues, and ADRs produce the *why*. Weave them into one explanation. Don't hand over two reports.

1. **Pick the few things they should walk away with** — from why they're asking (about to change it, reviewing it, debugging it, new to it) and what they already know, both read from the conversation, not quizzed out of them. Put the depth where their question is. Skip what they plainly know.
2. **Let the disciplines do the digging.** Get oriented by reading the code yourself, then map (`../understand/SKILL.md`) and history (git log + linked issues/ADRs), in parallel where the host allows. Match the size to the question — a small change may need only the map; keep history narrow by default, its full sweep is slow.
3. **Start with a plain definition** — name the thing and say what it is, the way a senior engineer would say it out loud — then tie it to the case ("in this repo, it's used to…") and build from there: how it works, the deeper reasons, the edge cases. Explain the mechanism, not the metaphor. Listing functions and constants is reference, not teaching.
4. **Smallest complete answer first** — a sentence or two, then stop. Add layers when they ask. Never a wall of text.
5. **Show, don't only tell.** Open the diff, the code, or the debugger when that lands faster. For anything with three or more moving parts, don't draw one crowded diagram — draw a series where each redraws the last and adds exactly one part, so the reader watches the system assemble. Three small growing diagrams beat one crowded diagram.
6. **Keep it a conversation.** No quizzes, no pacing theater ("pause here", "the key insight is", "the part worth slowing down on") — when you would pause, stop and let them respond. Keep the investigation's confidence language intact: hedges are findings, not style.

Write every explanation through `../unslop/SKILL.md` — plain spoken English, the way you'd explain it to a colleague. Tight, not terse: cut filler and hedging, keep the part that makes it click.
