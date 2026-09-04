---
name: lalp-sweep
description: Playbook for mechanical bulk changes across many sites — API migrations, renames, pattern rollouts. Build the lever (a script or codemod), dry-run it, review the diff it produces, apply, and verify — never hand-edit N sites. Loaded by lalp.
disable-model-invocation: true
---

# Playbook: Sweep

Same change, many sites. Hands are for one site; levers are for many (`../../principles/build-the-lever/SKILL.md`).

## 1. Inventory the sites

Find every site (`rg`/`grep`). Count them; classify the variants. Three or fewer sites with one variant → hand-editing *is* the lever: stop here and do it.

## 2. Build the lever

A script or codemod that makes the change mechanically. Deterministic, reviewable, re-runnable. It lives in the repo (`scripts/`), not in a shell history — the lever is the artifact a reviewer can rerun.

## 3. Dry-run and review

Run on a copy or with `--dry-run`. Review the produced diff like a PR: does each hunk match the intent? Adjust until the diff is **boring** — surprises in a mechanical diff are bugs in the lever.

## 4. Apply, verify, repeat

Apply. Build, tests, lint — green. Missed sites mean the inventory was wrong: fix the *search*, not just the site (`../../principles/root-cause/SKILL.md` applies to tooling too). Re-run until clean.

## 5. Delete the lever, or keep it named

One-shot lever: delete after the sweep. Reusable one: keep it, with one README line saying what it's for.

## Non-negotiable

No bulk hand-editing when a lever is buildable. No mechanical diff lands unreviewed.
