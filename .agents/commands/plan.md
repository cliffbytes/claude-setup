---
description: Read the .plans/ folder and summarize current priorities and next steps
allowed-tools: Read, Glob, Bash(ls:*)
---

1. Check if a `.plans/` folder exists at the root of the project.

2. **If `.plans/` exists** — list all files inside it using Glob, read each one, then jump to step 4.

3. **If `.plans/` does not exist** — check if a `PLAN.md` file exists at the root level.
   - If `PLAN.md` exists — read it, then jump to step 4.
   - If neither exists — stop and respond with:
     ```
     No plan files found.

     Create one of the following to get started:
     - A `.plans/` folder at the root with one or more Markdown files inside (e.g. `.plans/ROADMAP.md`)
     - A single `PLAN.md` file at the root of the project

     Then add a reference to it in AGENTS.md so Claude always loads it automatically.
     ```

4. Summarize the current state of the project using only what is written in the plan files:

```
## Current Priorities
1. ...
2. ...

## In Progress
- ...

## Blocked / Waiting
- ...

## Next Recommended Task
→ ...
```

Be concise. Do not invent tasks — only report what is written in the plan files.