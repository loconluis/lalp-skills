---
name: lalp-perf
description: Playbook for measured slowness — establish a reproducible baseline, profile before hypothesizing, fix the dominant cost with the smallest change, prove the win against the baseline, and loop one accepted win per commit. Loaded by lalp.
---

> **Resolving skill references**: skills named below are sibling skills. To load one, `read` its `SKILL.md` from the same directory this skill lives in (e.g. if this file is `~/.agents/skills/lalp-feature/SKILL.md`, then `lalp-grill` is at `~/.agents/skills/lalp-grill/SKILL.md`).

# Playbook: Perf

No numbers, no perf work. "Feels slow" is a report, not a measurement.

## 1. Baseline

A reproducible measurement: benchmark script, trace, timing harness — something you can re-run identically later. Numbers before touching anything. This is the wall every change gets compared against.

## 2. Profile

CPU trace, flamegraph, query plan, network waterfall — whatever shows where time actually goes for this workload. The profile names the suspect. Intuition doesn't.

## 3. One hypothesis, one fix

Attack the **dominant cost** only. Smallest change that removes it (`lalp-smallest-change`), kept reviewable — a 40% win inside a readable diff beats a 45% win inside a rewrite.

## 4. Measure against the baseline

Same harness, same conditions, before/after numbers side by side. Proven improvement lands; a wash or a regression **reverts** — and the hypothesis joins the decision log as ruled out.

## 5. Loop or stop

Meaningful win landed → commit it, re-profile, repeat while wins stay cheap (hillclimb: one hypothesis per cycle, one commit per accepted win, before/after in the message). Diminishing returns → stop and report the new baseline.

## Non-negotiable

No optimization without a profile naming the cost. No claimed win without before/after numbers.
