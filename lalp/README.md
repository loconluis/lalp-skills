# lalp

A self-contained engineering skill stack built on **Intent Specs Driven Development** — the coding-agent equivalent of a real engineering team, not a slop factory. Enter the mode, it routes the task to a playbook, the playbook runs the disciplines and principles. The intent spec is the contract everything else is traced against.

```
lalp/
├── SKILL.md          # the mode: enter → read index → classify → route → the ISDD spine (poteto-mode shape)
├── playbooks/        # one job each, copied verbatim into the work plan
│   ├── investigate   # read-only questions → evidence-backed map
│   ├── feature       # the main flow: shape → align → intent spec → tickets → TDD → review → ship
│   ├── bugfix        # reproduce → prove cause → fix mechanism → regression test → sweep
│   ├── refactor      # pin contract → target shape → green moves → migrate-and-delete
│   ├── sweep         # bulk mechanical change → build the lever (codemod), never hand-edit N sites
│   ├── perf          # baseline → profile → one fix per cycle → prove against baseline
│   ├── prototype     # settle a fork cheaply, arena N attempts, delete the losers
│   ├── ship          # walk every acceptance criterion → fresh review → land → watch CI
│   └── overnight     # unattended hours: verifiable units, disk state, morning report
├── principles/       # the rules playbooks lean on (one rule each)
│   ├── intent-first      # no code without an approved intent; the spec owns why/what, the diff owns how
│   ├── guard-context     # context is a budget — summaries, not payloads
│   ├── never-block       # proceed and present; confirm only the irreversible
│   ├── build-the-lever   # repeated work gets a tool, not hands
│   ├── sequence-units    # order work so the sequence proves itself
│   ├── root-cause        # reproduce, prove the cause, fix the mechanism
│   ├── smallest-change   # least code that meets the contract; delete > modify > add
│   └── preserve-behavior # the current contract is a constraint; deviations are named
└── disciplines/      # the procedures the playbooks call (one method each)
    ├── grill            # alignment interview, one branch at a time
    ├── intent-spec      # ISDD core — write the spec, pass the gate, keep it true
    ├── tickets          # tracer-bullet units, acceptance cited by name
    ├── architect        # sketch the shape twice, implement against it, scrap on friction
    ├── understand       # map a flow before changing it
    ├── tdd              # red → green → refactor, one vertical slice at a time
    ├── prove-it-works   # evidence must match what changed; pick the check that fits
    ├── code-review      # Standards + Spec axes, three verdict buckets
    ├── teach            # one plain account of what, how, and why (adapted from pstack /teach)
    └── unslop           # cut AI tells from every prose artifact (adapted from pstack /unslop)
```

## Intent Specs Driven Development

The spine is driven by one artifact — the **intent spec** (`specs/<name>.md` in the target project):

1. **Capture** the intent: why the change exists and what must be observably true afterward — never how.
2. **Gate**: explicit user approval turns the draft into the contract. No code exists before the gate.
3. **Trace**: tickets cite acceptance criteria by name (`A1`, `A2`, …); the review checks them criterion by criterion; ship walks them with evidence.
4. **Keep it true**: when implementation proves the spec wrong, the spec is updated and re-approved *before* the code changes. The spec outlives the PR as the decision record.

## Usage

```
/skill:lalp <task>     # enter the mode; it classifies and reads the matching playbook
```

This is **one skill**, poteto-mode style: pi treats a directory containing `SKILL.md` as a single skill, so the mode is the only entry point — playbooks, principles, and disciplines are reference files it loads by relative path.

## Inspirations

| Borrowed from | What it contributes here |
| --- | --- |
| Matt Pocock's skills — [The Main Flow](https://www.aihero.dev/skills) | the idea→ship spine (shape → grill → spec → tickets → implement → review), the spec approval gate and spec-as-decision-record, context-window discipline ("smart zone", fresh-context subagent reviews) |
| pstack by poteto ([cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack)) | the mode router with playbooks, the principles index, verbatim playbook copy with named skips, arena/swarm parallelism, prototype/ship/overnight playbooks, "write less, higher quality code" — plus adapted ports of its **architect**, **teach**, and **unslop** skills |

## Composition (host-side, optional)

Everything the stack needs is bundled. These compose when the host provides them:

- **Model routing & escalation** → `agentic-coding` decides *who* runs a step; the playbook decides *what* the step is.
- **Parallelism** → subagents + `paseo-committee`, `paseo-advisor`, `paseo-handoff`.
- **Dedicated UI router** (e.g. a sibling `locon-run` skill from the locon stack) → UI-shaped work hands off to it; `lalp` stays as orchestrator. Absent it, the playbooks apply with UI as the observable surface.

## Conventions

- All nested files carry `disable-model-invocation: true` (inert while nested — kept in case the stack is ever flattened into sibling skills). The mode itself is hidden and user-invoked, house style. Flip that flag on `SKILL.md` to let the agent auto-engage the mode.
- Playbooks get copied into the work plan **verbatim**; skipped steps stay in the list with the reason named.
- Every step ends with evidence — observed, not assumed.
- Never `colon+space` inside a frontmatter description — it breaks YAML parsing of unquoted frontmatter and pi silently drops the skill.
