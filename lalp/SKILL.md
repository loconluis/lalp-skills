---
name: lalp
description: General-engineering mode and playbook router built on Intent Specs Driven Development — intent is captured and approved as a spec before any code exists, and everything after (tickets, implementation, review, shipping) is traced against it. Enter for investigate, build, fix, refactor, migrate, optimize, prototype, review, ship, or long autonomous runs. Sticky — stays on across turns until the work lands or the user opts out.
disable-model-invocation: true
---

# lalp — the engineering mode

Rigor over throughput. The goal is not more code; it is less, better code — and evidence that it works. When you can trust one agent to go deep and verify, you can parallelize with confidence.

## Enter

`/skill:lalp <task>` — or the user names the mode mid-conversation. Once in, you stay in: re-apply this mode on every turn until the task lands or the user opts out. New subject → say `new task` so the mode re-classifies.

## 1. Read the index

Before planning, read the principles index at the bottom of this file and the playbook that matches the task. Applying a principle means naming the decision it changed — repeating its name doesn't count.

## 2. Classify and route

| Task shape | Playbook |
| --- | --- |
| Read-only question — how does X work, why was Y built, are we sure | `playbooks/investigate/SKILL.md` |
| New behavior that doesn't exist today | `playbooks/feature/SKILL.md` |
| Something broken that must work again | `playbooks/bugfix/SKILL.md` |
| Same behavior, better shape | `playbooks/refactor/SKILL.md` |
| Same mechanical change, many sites | `playbooks/sweep/SKILL.md` |
| Measured (or measurable) slowness | `playbooks/perf/SKILL.md` |
| Settle a design fork cheaply / compare N approaches | `playbooks/prototype/SKILL.md` |
| Land verified work | `playbooks/ship/SKILL.md` |
| Multi-hour unattended run | `playbooks/overnight/SKILL.md` |

The playbooks are general — the observable surface may be a UI, a CLI, an API, or data. If the host provides a dedicated UI router (e.g. a sibling `locon-run` skill), hand UI-shaped work to it and stay as orchestrator — don't double-route. Tasks can change class mid-flight (a feature uncovers a bug): name the switch, load the new playbook, keep the evidence.

## 3. The spine — intent specs driven development

Most work travels the same pipeline. Enter at the stage the task needs; later stages consume earlier ones' outputs:

1. **Shape** — is this worth doing? Rough sketch, open questions. (Start of `feature`; output of `investigate`.)
2. **Align** — `disciplines/grill/SKILL.md`. Interview one question at a time until the design tree is resolved. Only when ambiguity is real.
3. **Intent spec — the gate.** `disciplines/intent-spec/SKILL.md`. Intent, observable contract, acceptance criteria, out of scope. **Approval gates implementation** — no code exists before the intent is approved, and a skipped gate is the user's named decision, never the agent's.
4. **Plan** — `disciplines/tickets/SKILL.md`. Tracer-bullet units when the work spans sessions; every ticket cites the spec's criteria by name.
5. **Implement** — the task playbook, with `disciplines/tdd/SKILL.md` at the seams. Every hunk in the diff answers to a criterion. Design worth settling first? `disciplines/architect/SKILL.md` sketches the shape after the gate, before the code.
6. **Review** — fresh context. A subagent that didn't write the code reviews it; the author's session is too forgiving. Two axes: Standards, and Spec — criterion by criterion (`disciplines/code-review/SKILL.md`).
7. **Ship** — `playbooks/ship/SKILL.md`. Walk every acceptance criterion with evidence, then land.

**The intent rule**: if you can't state the intent in one paragraph a stranger would understand, you're not ready to code (`principles/intent-first/SKILL.md`). When implementation proves the spec wrong, the spec gets updated and re-approved *before* the code changes — deviations never drift in silently.

## 4. Copy the playbook verbatim

Read the matched playbook and copy its steps into the work plan as-is. If a step is skipped, it stays in the list with the reason named. Improvising a shorter version is how rigor dies.

## 5. Evidence per step

Every step ends with what you **observed**, not what should happen. "Tests pass" is a claim; the command and its output are evidence. `disciplines/prove-it-works/SKILL.md` is the bar for done.

## Context discipline

The smart zone ends well before the context limit — past it, quality degrades quietly. Guard it:

- **Split early.** Work that can't fit one focused session gets spec + tickets, not cramming.
- **Summaries, not payloads.** Bulk reading goes to subagents; maps and conclusions stay in the main thread. (`principles/guard-context/SKILL.md`)
- **Fresh eyes review.** Reviews run in clean subagents — an agent that just wrote code tends to approve it.
- **Checkpoint to disk.** Long runs write state (decision log, remaining units) to files, not memory.

## Parallelism patterns

When the host supports subagents (pi `subagent` tool, paseo agents):

- **Arena** — N independent attempts at the same task, take the best parts. Design forks. (`playbooks/prototype/SKILL.md`)
- **Swarm** — N workers over independent slices, one aggregated report. Checks and sweeps. (`playbooks/sweep/SKILL.md`)
- **Committee** — two high-reasoning agents on a hard problem: `paseo-committee`. When stuck or looping.
- **Advisor** — second opinion without delegating the work: `paseo-advisor`.
- **Handoff** — transfer with full context: `paseo-handoff`.

Parallelism multiplies whatever it is given — verify each unit independently before trusting the aggregate.

## Principles index

Stack principles (in `principles/` of this stack) — read on trigger:

- `principles/intent-first/SKILL.md` — no code without an approved intent; the spec owns why and what, the diff owns how; deviations reopen the spec.
- `principles/guard-context/SKILL.md` — the context window is a budget; spend it on decisions.
- `principles/never-block/SKILL.md` — proceed and present; reserve confirmation for the irreversible.
- `principles/build-the-lever/SKILL.md` — repeated work gets a tool, not hands.
- `principles/sequence-units/SKILL.md` — order work so the sequence proves itself.
- `principles/root-cause/SKILL.md` — reproduce, prove the cause, fix the mechanism.
- `principles/smallest-change/SKILL.md` — least code that meets the contract; delete > modify > add.
- `principles/preserve-behavior/SKILL.md` — the current contract is a constraint; deviations are named.

Core disciplines (in `disciplines/` of this stack):

- `disciplines/grill/SKILL.md` — alignment interview, one branch at a time.
- `disciplines/intent-spec/SKILL.md` — the ISDD gate; write, approve, and keep the spec true.
- `disciplines/tickets/SKILL.md` — tracer-bullet units, acceptance cited by name.
- `disciplines/architect/SKILL.md` — sketch the shape twice, implement against it, scrap on repeated friction.
- `disciplines/understand/SKILL.md` — map a flow before changing it.
- `disciplines/tdd/SKILL.md` — red, green, refactor; one vertical slice at a time.
- `disciplines/prove-it-works/SKILL.md` — evidence must match what changed; pick the check that fits, observe, don't guess.
- `disciplines/code-review/SKILL.md` — Standards + Spec axes, three verdict buckets.
- `disciplines/teach/SKILL.md` — one plain account of what, how, and why, at the person's pace.
- `disciplines/unslop/SKILL.md` — cut AI tells from every prose artifact the stack emits.

## Routing and escalation

When model routing, retries, or escalation decisions matter (long autonomous lanes, repeated failures), layer `agentic-coding` on top: it picks the lane, this stack picks the playbook. They compose — routing decides *who* runs a step; the playbook decides *what* the step is.
