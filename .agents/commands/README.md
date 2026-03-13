# .agents/commands — Template

Custom slash commands for Claude Code.  
Each `.md` file in this folder becomes a `/command` you can type in any session.

---

## How It Works

```
.agents/commands/
├── commit.md          →  /commit
├── review.md          →  /review
├── todo.md            →  /todo
└── fix.md             →  /fix [description]
```

The filename (without `.md`) becomes the slash command name.  
Write the command body in plain Markdown — Claude follows it as instructions.

---

## Frontmatter Options

Every command file supports optional YAML frontmatter:

```markdown
---
description: What this command does (shown in /help)
argument-hint: [optional args]        # shown as hint when typing
allowed-tools: Read, Bash, Edit       # tools this command can use
model: claude-haiku-4-5-20251001      # override model for this command
---

Your instructions here...
```

- **`description`** — shown in `/help` and autocomplete
- **`argument-hint`** — hint displayed as you type the command
- **`allowed-tools`** — restrict which tools this command can call
- **`model`** — use a cheaper/faster model for simple commands
- **`$ARGUMENTS`** — placeholder that captures everything typed after the command name

---

## Usage

```bash
/commit                     # runs commit.md
/review                     # runs review.md
/fix login page is broken   # $ARGUMENTS = "login page is broken"
```

---

## Tips

- Keep each command focused on **one task**
- Use `$ARGUMENTS` when the command needs user input
- Prefix lines with `!` to run shell commands inline (e.g., `` !`git diff HEAD~1` ``)
- List your commands in `AGENTS.md` so Claude always knows they exist
