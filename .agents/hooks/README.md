# .claude/hooks — Template

A minimal, beginner-friendly hooks setup for Claude Code.  
Hooks give you **deterministic, guaranteed control** over what Claude does — unlike instructions in `AGENTS.md` which Claude can choose to ignore.

---

## File Overview

```
.claude/
└── settings.json          ← registers all hooks (Claude Code reads this)

.agents/hooks/
├── session-start.sh       ← runs when Claude Code launches
├── pre-bash.sh            ← runs before every shell command (blocks dangerous ones)
├── pre-file-write.sh      ← runs before every file edit (blocks protected files)
├── post-file-write.sh     ← runs after every file edit (auto-format)
└── on-stop.sh             ← runs when Claude finishes (notifications)
```

---

## How Hooks Work

```
User prompt
    │
    ▼
SessionStart hook          ← inject context Claude sees at start
    │
    ▼
Claude thinks + acts
    │
    ├── PreToolUse hook    ← intercept BEFORE tool runs (can block)
    │       │
    │   [tool runs]
    │       │
    └── PostToolUse hook   ← intercept AFTER tool runs (format, log)
    │
    ▼
Stop hook                  ← Claude is done (notify, cleanup)
```

**Exit codes** (for PreToolUse hooks):
| Exit code | Meaning |
|---|---|
| `0` | Allow — the tool runs normally |
| `2` | Block — tool is cancelled, `stderr` message is sent to Claude |
| anything else | Non-blocking error — logged, execution continues |

---

## Setup

### 1. Make all hook scripts executable

```bash
chmod +x .agents/hooks/*.sh
```

### 2. Link `.claude/` to `.agents/hooks/` (if using symlinks)

```bash
ln -s ../.agents/hooks .claude/hooks
```

Or just keep `settings.json` in `.claude/` and scripts in `.agents/hooks/` — the paths in `settings.json` handle the rest.

### 3. Customize for your project

- **`pre-bash.sh`** — add dangerous commands specific to your stack to `BLOCKED_PATTERNS`
- **`pre-file-write.sh`** — add files/dirs Claude must never touch to `PROTECTED`
- **`post-file-write.sh`** — uncomment your formatter (prettier, black, clang-format…)
- **`on-stop.sh`** — uncomment the notification for your OS

---

## Quick Reference — Hook Events

| Event | When it fires | Can block? |
|---|---|---|
| `SessionStart` | Claude Code launches | No |
| `PreToolUse` | Before any tool runs | ✅ Yes (exit 2) |
| `PostToolUse` | After any tool runs | No |
| `Stop` | Claude finishes responding | No |
| `UserPromptSubmit` | User sends a message | ✅ Yes (exit 2) |
| `SessionEnd` | Session terminates | No |

> Use `/hooks` inside Claude Code to manage hooks interactively without editing JSON manually.

---

## Security Note

Hook scripts run as **shell commands on your machine**. Keep them simple, never pipe untrusted input directly into `eval` or `sh`, and review any hook before enabling it.
