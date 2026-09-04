---
name: lalp-unslop
description: Discipline — cut AI tells from anything the stack writes. Specs, tickets, commit messages, PR descriptions, reports, and explanations are written in plain spoken language with a human voice. Applied to every prose artifact the stack produces.
disable-model-invocation: true
---

# Discipline: Unslop

Edit text to remove AI patterns and add human voice. Match the intended tone; preserve the meaning. Applies to every piece of prose this stack emits — intent specs, tickets, decision logs, commit messages, PR descriptions, reports, teach output.

## Process

1. Scan for the patterns below.
2. Rewrite.
3. Add voice (next section).
4. Self-audit — "what makes this obviously AI generated?" — fix the remaining tells.

## Adding voice

Removing patterns is half the job; sterile, voiceless writing is just as obvious.

- **Have opinions.** React to facts; don't neutrally list pros and cons.
- **Vary rhythm.** Short sentences. Then longer ones that take their time.
- **Acknowledge complexity.** "Impressive but also kind of unsettling" beats "impressive".
- **Use "I" when it fits.** First person isn't unprofessional.
- **Let some mess in.** Perfect structure looks machine-made.
- **Be specific.** Not "this is concerning" — say what, and why it unsettles.

## Patterns to detect and fix

**Content** — puffery ("pivotal moment", "testament to", "evolving landscape", "setting the stage for"): state what happened. Superficial -ing phrases ("highlighting…", "ensuring…", "showcasing…"): delete or expand with real content. Promotional language ("groundbreaking", "stunning", "renowned", "vibrant"). Vague attribution ("experts believe", "industry reports suggest"): name the source or cut. Formulaic resilience ("despite challenges… continues to thrive"): replace with specific facts.

**Language** — AI vocabulary (additionally, crucial, delve, enduring, foster, garner, intricate, interplay, pivotal, showcase, tapestry, underscore): plain words. Fancy ways to say "is" ("serves as", "stands as", "boasts", "features"): say "is" or "has". "Not just X, but Y": state the point directly. Rule of three: use the natural number, don't force triads. Synonym cycling (protagonist / main character / central figure in one piece): pick one name per concept and keep it. False ranges ("from X to Y" where X and Y aren't on a scale): list the topics.

**Style** — em dash overuse: the loudest tell; periods and commas instead, and parentheses instead of an em dash just trades one tell for another. Colons as mid-sentence connectors: rewrite so the point stands alone. Bold on every proper noun or acronym: stop. Bold-label lines that restate their own label ("**Performance:** performance improved…"): convert to prose. Title case headings: sentence case. Decorative emojis: remove. Curly quotes: straight.

**Chatbot artifacts** — "I hope this helps!", "Let me know if…", "Of course!", "Certainly!": remove. Cutoff disclaimers ("while specific details are limited…"): find the facts or cut. Sycophancy ("Great question!", "You're absolutely right!"): respond directly.

**Filler** — "in order to" → to. "Due to the fact that" → because. "It is important to note that" → delete. Stacked hedges ("could potentially possibly be argued"): may. Generic conclusions ("the future looks bright"): specific plans or facts.

**Jargon** — abstract metaphor nouns (substrate, wedge, vector, locus, nexus, primitive-as-noun, bedrock, scaffolding-as-metaphor, north star, flywheel, endgame, modality): the concrete word. "API surface" → interface. "Gold-plating" → more than the job needs. "Evacuate code" → move it out.

**Plain speech** — say what it does, not how it feels: the mechanism or the number (".toSQL() returns the exact string sent to the database", not "SQL you can read"). One test: if the sentence could appear unchanged in another project's docs, it says nothing about this one — cut it. Split dense sentences: one idea each. Active voice: name the actor ("the compiler validates queries", not "queries are validated"). Cut adverbs or use the stronger verb ("significantly improves" → the measured delta). Prefer the plain word: utilize → use, leverage → use, facilitate → help, numerous → many.
