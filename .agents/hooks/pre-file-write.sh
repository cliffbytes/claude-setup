#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
# Hook: PreToolUse (matcher: Edit|Write|MultiEdit)
# Runs: before Claude writes or edits any file
# Input: JSON on stdin with { tool_input: { path } }
# Exit 0 = allow   |   Exit 2 = block
# ─────────────────────────────────────────────────────────────

INPUT=$(cat)

# Extract the file path Claude wants to write
FILEPATH=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin)['tool_input']; print(d.get('path', d.get('file_path','')))" 2>/dev/null)

# ── Protected files — Claude must never touch these ───────────
PROTECTED=(
  ".env"
  ".env.production"
  ".env.prod"
  "secrets.yaml"
  "secrets.json"
  "id_rsa"
  "id_ed25519"
)

for PROTECTED_FILE in "${PROTECTED[@]}"; do
  if [[ "$(basename "$FILEPATH")" == "$PROTECTED_FILE" ]]; then
    echo "Blocked: writing to '$FILEPATH' is not allowed." >&2
    exit 2
  fi
done

# ── Protected directories ─────────────────────────────────────
if echo "$FILEPATH" | grep -qE '^(migrations/|\.github/workflows/)'; then
  echo "Blocked: '$FILEPATH' is in a protected directory. Confirm manually before editing." >&2
  exit 2
fi

exit 0