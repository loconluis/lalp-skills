---
name: lalp-understand
description: Map a flow before changing it. Load when about to modify a component, endpoint, or flow you don't fully know — find the entry point, trace what executes, who owns the state, where data comes from, and the sharp edges. Produces a map, not code.
---

# Discipline: Understand — map before touching

## What it produces

A short map of the flow: concepts, runtime path, relevant files, sharp edges. A mental model, not annotated source code.

## How

1. **Entry** — how does execution, the user, or the data get in? (route, component, endpoint, command, event). Follow the path down to the element you're about to touch.
2. **Data** — where does it come from? (API, store, props, context, queue, file). Sync or async? Where is it transformed?
3. **State** — who owns each observable state: local, global, server? Who writes it, who reads it?
4. **Branches** — loading / empty / error / success (or the domain's equivalents): which exist today?
5. **Surface affordances** — for UI flows: keyboard path, focus, contrast, labels.
6. **Sharp edges** — the weird parts of the flow: edge cases, hidden dependencies, behaviors that look like bugs but are intentional.

## Rule

If you can't draw the map, you can't modify the flow. Write the map before the first diff.

## Delegation (optional)

If your host supports spawning a subagent with isolated context, you may hand the recon to a scout — it reads a lot without polluting your context. The brief must be self-contained, and the map must come back in this exact structure so an agent that hasn't seen the files can act on it. No such capability on your host? Do the recon inline.
