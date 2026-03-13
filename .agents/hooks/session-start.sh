#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
# Hook: SessionStart
# Runs: every time Claude Code launches in this project
# Input: JSON on stdin (session_id, cwd, etc.)
# Output: stdout is visible to Claude as context
# ─────────────────────────────────────────────────────────────

# Read the event JSON (optional — use if you need session_id etc.)
INPUT=$(cat)

# Print context Claude will see at session start.
# Useful for injecting dynamic info (git branch, date, reminders).
echo "=== Session started at $(date '+%Y-%m-%d %H:%M') ==="
echo "Branch: $(git branch --show-current 2>/dev/null || echo 'not a git repo')"
echo "Reminder: Always read .plans/ before starting a task."

# Exit 0 = success, session continues normally
exit 0