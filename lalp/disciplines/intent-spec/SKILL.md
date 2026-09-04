---
name: lalp-intent-spec
description: The core discipline of Intent Specs Driven Development — turn a request into a short intent spec (intent, observable contract, acceptance criteria, out of scope), get explicit approval before any code exists, and keep the spec as the living contract everything downstream is traced against. Loaded at the gate stage of the feature flow.
disable-model-invocation: true
---

# Discipline: Intent spec

The spec's job is alignment, not paperwork. It captures **why** the change exists and **what must be observably true** afterward — never how. Short enough to read in two minutes; sharp enough that a second agent could implement it without asking questions.

## 1. Ground the request

Re-read what the user asked. Ask 2-3 sharp questions only where something material is ambiguous (outcomes, scope edges, conflicting priorities). Don't run a full interview — most of the contract comes from the request itself. Deep ambiguity is `../grill/SKILL.md`'s job, and it hands off here.

## 2. Write the spec

Create `specs/<name>.md` in the project (or where the user prefers). Sections:

- **Intent** — one paragraph in the user's terms: the problem, why it matters, the outcome wanted. If you find two intents, write two specs.
- **Contract** — the observable behavior after the change, at every state that matters (idle / running / empty / error / success — whichever states fit this surface: UI, CLI, API, data). What the user or caller observes in each, where each datum comes from, who owns it. If the change modifies existing behavior, record the old contract too — it becomes a preservation constraint.
- **Acceptance criteria** — checkable, observable statements ("when X then Y", "the command exits 0 and prints Z"). Name each one — `A1`, `A2`, … — because tickets, reviews, and ship all cite them by name.
- **Out of scope** — what this spec explicitly does not cover. Changes outside scope are findings, not gifts.
- **Open questions** — resolved during grounding, or marked pending with the person who must answer.

Follow `../understand/SKILL.md` first if you don't fully know the flow the spec touches. Write the spec in plain language, through `../unslop/SKILL.md` — it is read by humans and agents alike.

## 3. The approval gate

Present the spec summary and ask to proceed. **Never implement before explicit approval.** Before approval it is a draft; after approval it is the contract:

- Tickets are split from it and cite its criteria by name (`../tickets/SKILL.md`).
- Implementation is traceable to it — every hunk answers to a criterion, with `../tdd/SKILL.md` at the seams.
- Review checks it criterion by criterion (`../code-review/SKILL.md`, Spec axis).
- Ship walks every criterion with evidence.

The user may skip the gate on small, obvious changes — the skip is the user's named decision, never the agent's silent one.

## 4. Keep it true

The spec is a living decision record, not an artifact frozen at approval. When implementation reveals the spec was wrong, update the spec and re-approve — never drift silently from it. When reality teaches a lesson, it lands in the spec, dated, so the next reader — human or agent — inherits the reasoning, not just the code.
