#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
# Hook: PreToolUse (matcher: Bash)
# Runs: before every shell command Claude executes
# Input: JSON on stdin with { tool_name, tool_input: { command } }
# Exit 0 = allow   |   Exit 2 = block (stderr goes to Claude)
# ─────────────────────────────────────────────────────────────

INPUT=$(cat)

# Extract the command Claude wants to run
COMMAND=$(echo "$INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin)['tool_input'].get('command',''))" 2>/dev/null)

# ── Blocklist: patterns you never want Claude to run ──────────
BLOCKED_PATTERNS=(
  "rm -rf /"
  "rm -rf ~"
  ":(){ :|:& };:"   # fork bomb
  "dd if=/dev/zero"
  "> /dev/sda"
  "mkfs"
  "shutdown"
  "reboot"
)

for PATTERN in "${BLOCKED_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qF "$PATTERN"; then
    echo "Blocked dangerous command: $PATTERN" >&2
    exit 2  # blocks the tool call; stderr is shown to Claude
  fi
done

# ── Sensitive file guard ───────────────────────────────────────
# Block any command that touches .env files
if echo "$COMMAND" | grep -qE '\.env[^a-z]|\.env$'; then
  echo "Blocked: direct shell access to .env files is not allowed." >&2
  exit 2
fi

# Allow everything else
exit 0