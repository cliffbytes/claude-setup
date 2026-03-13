---
description: Investigate and fix a described problem
argument-hint: [description of the problem]
allowed-tools: Read, Edit, Bash, Grep, Glob
---

Problem to fix: $ARGUMENTS

Follow these steps:

1. **Understand** — Read relevant files to understand the current behavior.
2. **Locate** — Find the exact lines causing the issue using grep or file inspection.
3. **Plan** — Briefly describe what you will change and why (2–3 lines max).
4. **Fix** — Make the minimal change needed to solve the problem. Do not refactor unrelated code.
5. **Verify** — If there is a test command available, run it. Report the result.

Be surgical. Touch only what is necessary to fix `$ARGUMENTS`.
