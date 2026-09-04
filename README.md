# lalp-skills

A portable, self-contained engineering skill stack built on **Intent Specs Driven Development**, with pstack-style playbooks — plug and play for **pi**, **Claude Code**, and **Codex**. One canonical repo; every harness links to it. No external skill dependencies: everything the stack references lives here.

## The map — every node is clickable

```mermaid
flowchart TD
    entry(["/skill:lalp &lt;task&gt;"]) --> mode

    subgraph router["lalp — the mode"]
        mode["read principles index → classify<br/>copy playbook verbatim → evidence per step"]
    end

    mode -->|"read-only question"| investigate["investigate"]
    mode -->|"new behavior"| feature["feature"]
    mode -->|"broken"| bugfix["bugfix"]
    mode -->|"better shape"| refactor["refactor"]
    mode -->|"same change, many sites"| sweep["sweep"]
    mode -->|"measured slowness"| perf["perf"]
    mode -->|"design fork"| prototype["prototype"]
    mode -->|"land verified work"| ship["ship"]
    mode -->|"unattended hours"| overnight["overnight"]

    subgraph spine["the ISDD spine — feature flow"]
        direction LR
        shape["shape"] --> grill["grill<br/>only if ambiguous"] --> spec["intent spec<br/>criteria A1…An"] --> gate{"approval<br/>gate"} --> tickets["tickets<br/>cite A1…An"] --> impl["implement<br/>tdd · architect"] --> review["review<br/>code-review"] --> walk["ship<br/>walks every An"]
    end

    feature -.-> shape
    gate -.->|"skip = user's named decision"| impl
    review -.->|"spec wrong? reopen it"| spec

    click mode "lalp/SKILL.md"
    click investigate "lalp/playbooks/investigate/SKILL.md"
    click feature "lalp/playbooks/feature/SKILL.md"
    click bugfix "lalp/playbooks/bugfix/SKILL.md"
    click refactor "lalp/playbooks/refactor/SKILL.md"
    click sweep "lalp/playbooks/sweep/SKILL.md"
    click perf "lalp/playbooks/perf/SKILL.md"
    click prototype "lalp/playbooks/prototype/SKILL.md"
    click ship "lalp/playbooks/ship/SKILL.md"
    click overnight "lalp/playbooks/overnight/SKILL.md"
    click grill "lalp/disciplines/grill/SKILL.md"
    click spec "lalp/disciplines/intent-spec/SKILL.md"
    click tickets "lalp/disciplines/tickets/SKILL.md"
    click impl "lalp/disciplines/tdd/SKILL.md"
    click review "lalp/disciplines/code-review/SKILL.md"
    click walk "lalp/playbooks/ship/SKILL.md"
```

Open any node to read the actual playbook or discipline. The gate is the ISDD invariant: no code before the intent spec is approved, and a spec proven wrong is reopened before the code changes.

```
luis-skills/
├── install.sh            # linker for all harnesses
└── lalp/                 # THE MODE — one skill, the whole stack
    ├── SKILL.md          #   classify → route → the ISDD spine → principles index
    ├── playbooks/        #   investigate, feature, bugfix, refactor, sweep, perf, prototype, ship, overnight
    ├── principles/       #   intent-first, guard-context, never-block, build-the-lever, sequence-units,
    │                     #   root-cause, smallest-change, preserve-behavior
    └── disciplines/      #   grill, intent-spec, tickets, architect, understand, tdd, prove-it-works,
                          #   code-review, teach, unslop
```

## The idea — intent specs driven development

One artifact drives everything: the **intent spec**. The intent is captured (why + what must be observably true, never how), approved by the user — the gate — and from there every stage is traced against it: tickets cite acceptance criteria by name, review checks them criterion by criterion, ship walks them with evidence, and a discovered deviation updates the spec before it updates the code. The spec outlives the PR as the decision record.

Around that gate, the mode works poteto-mode style: it classifies the task, reads the principles index, copies the matching playbook **verbatim** into the work plan (skipped steps stay visible with their reason), and demands evidence at every step.

## Install

```bash
./install.sh                          # symlink lalp into pi, Claude Code, and Codex
HARNESSES="pi claude" ./install.sh    # only some harnesses
./install.sh copy                     # physical copy instead of symlink
./install.sh uninstall                # remove the stack everywhere, incl. stale leftovers
```

Symlink is the default: edit here, every harness updates instantly. `copy` re-run refreshes.

`uninstall` removes the stack plus leftovers from older versions (renamed/dropped skills), whether they were linked or copied — but never touches skills that don't belong to this stack.

## Use it

| Harness | How to enter the mode |
| --- | --- |
| pi | `/skill:lalp <task>` — or ask the agent to load `~/.agents/skills/lalp/SKILL.md` |
| Claude Code | "use the lalp skill" or reference `~/.claude/skills/lalp/SKILL.md` |
| Codex | reference `~/.codex/skills/lalp/SKILL.md` in your prompt or `AGENTS.md` |

The prompt shape the mode likes:

```
/skill:lalp <what you observed or what you want>
Done means <something the agent can run or inspect>.
Keep <existing behavior that must not change>.
```

Host-side extras the mode can use when present (optional, not bundled): subagents (arena/swarm), `paseo-committee` / `paseo-advisor` / `paseo-handoff`, `agentic-coding` for model routing, and a dedicated UI router (e.g. the locon stack's `locon-run`) for UI-shaped handoffs.

## Portability rules (why it works everywhere)

- **One skill**: the repo exposes exactly one top-level skill — `lalp`. Playbooks, principles, and disciplines are reference files it loads by relative path.
- **Agent Skills standard frontmatter** only: `name`, `description`, `disable-model-invocation`.
- **Dir name = skill name**, as the strict standard requires.
- **Never `colon+space` inside a description** — it breaks YAML parsing of unquoted frontmatter and pi silently drops the skill.
- All references are relative paths that survive any install location.
- Pure markdown — no scripts, no executables, no network. Safe to vendor anywhere.

## Inspirations

- **Matt Pocock's skills — [The Main Flow](https://www.aihero.dev/skills)**: idea→ship spine (shape → grill → spec → tickets → implement → review), the spec approval gate and spec-as-decision-record, context-window discipline ("smart zone", fresh-context subagent reviews).
- **pstack by poteto** ([cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack)): the mode router with playbooks, the principles index, verbatim playbook copy, arena/swarm parallelism, prototype/ship/overnight playbooks — and the **architect**, **teach**, and **unslop** skills, adapted here (Cursor model routing stripped, wired into the ISDD spine).
