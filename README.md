# Claude Code Setup Guide

> A beginner-friendly guide to setting up a clean, maintainable, and secure Claude Code workspace.

---

## Table of Contents

1. [Project Structure](#project-structure)
2. [AGENTS.md / CLAUDE.md](#agentsmd--claudemd)
3. [Symlinks Explained](#symlinks-explained)
4. [Adding Skills](#adding-skills)
5. [Security & Prompt Injection](#security--prompt-injection)
6. [Managing Your Plans](#managing-your-plans)

---

## Project Structure

A well-organized Claude Code setup uses a central `.agents/` folder as the **single source of truth**, then links it to where Claude Code expects things (`.claude/`). You only ever edit files in `.agents/`.

```
your-project/
├── CLAUDE.md          → symlink to AGENTS.md  (Claude Code reads this automatically)
├── AGENTS.md          ← the real file you edit
│
├── .agents/           ← your source of truth
│   ├── skills/        ← reusable AI skill definitions
│   ├── commands/      ← custom slash commands
│   ├── rules/         ← behavior rules for Claude
│   └── hooks/         ← event-triggered scripts
│
├── .claude/           ← where Claude Code looks for config
│   ├── skills/        → symlink to .agents/skills/
│   ├── commands/      → symlink to .agents/commands/
│   ├── rules/         → symlink to .agents/rules/
│   └── hooks/         → symlink to .agents/hooks/
│
└── .plans/            ← your project plans (optional but recommended)
    └── ROADMAP.md
```

> **Why two folders?** Claude Code looks in `.claude/` for config. You keep real files in `.agents/` and point `.claude/` to them with symlinks. Edit only `.agents/` — changes appear automatically in `.claude/`.

---

## AGENTS.md / CLAUDE.md

`CLAUDE.md` is the **most important file** in your setup. Claude Code reads it automatically every time it starts. Since `CLAUDE.md` is a symlink to `AGENTS.md`, you only ever edit `AGENTS.md`.

Use it to tell Claude about your project, your preferences, coding standards, and anything it should always know.

### What to put in AGENTS.md

| Category | Example content |
|---|---|
| Project context | What the project is, the language and stack |
| Coding conventions | Tab size, naming style, linting rules |
| Key commands | `make build`, `npm run dev`, test commands |
| File references | Links to plans, architecture docs, schemas |
| Things to avoid | "Never delete migration files", "Don't modify config.prod.yaml" |

### Minimal starter template

```markdown
# Project: my-app

## Stack
- Language: C / Python
- Build: Makefile

## Conventions
- 4-space indentation, no tabs
- Snake_case for variables
- All public functions must have docstrings

## Key Commands
- `make`       — build the project
- `make test`  — run tests
- `make clean` — clean build artifacts

## Plans
- See `.plans/ROADMAP.md` for current priorities
```

---

## Symlinks Explained

Symlinks let a file or folder "point" to another location. Editing the real file updates both places instantly.

### How to set them up

```bash
# At the root of your project:

# 1. CLAUDE.md → AGENTS.md
ln -s AGENTS.md CLAUDE.md

# 2. .claude/ subfolders → .agents/ subfolders
mkdir -p .agents/skills .agents/commands .agents/rules .agents/hooks
mkdir -p .claude

ln -s ../.agents/skills    .claude/skills
ln -s ../.agents/commands  .claude/commands
ln -s ../.agents/rules     .claude/rules
ln -s ../.agents/hooks     .claude/hooks
```

After this, **only edit files inside `.agents/`** — never touch `.claude/` directly.

---

## Adding Skills

Skills are reusable instructions that extend what Claude can do in your project (generate docs, follow a specific workflow, run audits, etc.).

### Where to find skills

Browse and search the community skills registry at **[skills.sh](https://skills.sh/)**.

### Finding a skill with Claude Code

```bash
/find-skill "describe what you need"
```

Try different keywords if the first search doesn't give good results. The command searches the registry for you.

### Creating a custom skill

```bash
/create-skill
```

This walks you through the process of defining a new skill from scratch and saving it into `.agents/skills/`.

### Installing a skill

Once you find or create a skill, place it in `.agents/skills/`. It will be available via `.claude/skills/` automatically through the symlink.

---

## Security & Prompt Injection

> ⚠️ **This is the most important section for your safety.**

Skills downloaded from the internet can contain **malicious hidden instructions** — this is called a **prompt injection attack**. A bad actor embeds instructions inside a skill file that silently alter Claude's behavior: leaking your code, deleting files, or doing things you never asked for.

### How to spot a dangerous skill

Before installing any skill, read it carefully and look for:

- Instructions hidden in comments or whitespace
- Commands that seem unrelated to what the skill claims to do
- References to external URLs or APIs you didn't expect
- Anything that asks Claude to "ignore previous instructions"

### Safe skill workflow

```markdown
1. Download / find the skill
2. Open the skill file and read every line
3. Look for anything unexpected or suspicious
4. Only then move it into .agents/skills/
```

Use `/find-skill` as a starting point, but **always audit manually before using**. The few minutes it takes can protect your entire project.

---

## Managing Your Plans

Claude Code does **not** automatically read `PLAN.md` or your `.plans/` folder. You must explicitly tell it about them in `AGENTS.md`.

### Option 1 — Single plan file

Create a `PLAN.md` at the root and reference it in `AGENTS.md`:

```markdown
## Plans
- See `PLAN.md` for the current project roadmap
```

### Option 2 — Multiple plan files

Create a `.plans/` folder at the root and reference it:

```markdown
.plans/
├── ROADMAP.md
├── SPRINT-1.md
└── ARCHITECTURE.md
```

Then in `AGENTS.md`:

```markdown
## Plans
- See `.plans/ROADMAP.md` for the overall roadmap
- See `.plans/SPRINT-1.md` for current sprint tasks
```

### Option 3 — Reference inline during a session

If you forget to add it to `AGENTS.md`, you can point Claude to it during a session:

```markdown
Read PLAN.md before we start
```

or using the `@` syntax:

```markdown
@PLAN.md what should we work on next?
```

> Since `CLAUDE.md` is a symlink to `AGENTS.md`, adding references there is all you need — no need to edit anything in `.claude/`.
