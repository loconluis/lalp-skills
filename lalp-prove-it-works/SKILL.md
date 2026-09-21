---
name: lalp-prove-it-works
description: Discipline — prove a change with evidence that matches what changed. A green build is never proof; pick the verification that fits (render, interaction, output, data), run it on the real artifact, and record what you observed without guessing.
---

# Discipline: Prove it works

"The build passes" is never enough. The evidence must match what changed — pick the verification that fits:

| What changed… | Verify… |
| --- | --- |
| A surface (component, page, screen) | Render it on the real app — and in isolation if the state requires it |
| State / interaction | Drive the real interaction — click, input, navigate, call |
| Style / layout | Look at it — capture before/after of the affected area |
| Output (CLI, API, log) | Run the real command or request; inspect the actual output |
| Data | Inspect the record that was written or read |

## If the repo can't verify

Create the mechanism before finishing: dev server, story, script, or a harness. If it's impossible, say so explicitly instead of faking it.

## Evidence

Record what you observed (a concrete result), not what you expect to happen. "Should work" is not evidence; the command and its output are. A step without evidence is incomplete.
