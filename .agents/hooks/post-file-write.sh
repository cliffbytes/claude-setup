#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
# Hook: PostToolUse (matcher: Edit|Write|MultiEdit)
# Runs: after Claude writes or edits a file
# Input: JSON on stdin with { tool_input: { path } }
# Exit 0 = success (non-blocking even if formatter fails)
# ─────────────────────────────────────────────────────────────

INPUT=$(cat)

FILEPATH=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin)['tool_input']; print(d.get('path', d.get('file_path','')))" 2>/dev/null)
EXT="${FILEPATH##*.}"

# ── Auto-format based on file extension ───────────────────────
# Uncomment the formatters you actually use in your project.

case "$EXT" in
  js|jsx|ts|tsx|json|css|html|md)
    # if command -v prettier &>/dev/null; then
    #   prettier --write "$FILEPATH" 2>/dev/null
    # fi
    ;;
  py)
    # if command -v black &>/dev/null; then
    #   black "$FILEPATH" 2>/dev/null
    # fi
    ;;
  go)
    # if command -v gofmt &>/dev/null; then
    #   gofmt -w "$FILEPATH" 2>/dev/null
    # fi
    ;;
  c|h|cpp|hpp)
    # if command -v clang-format &>/dev/null; then
    #   clang-format -i "$FILEPATH" 2>/dev/null
    # fi
    ;;
esac

# ── Log the edit (optional) ───────────────────────────────────
# echo "$(date '+%Y-%m-%d %H:%M:%S') EDITED $FILEPATH" >> .agents/hooks/edit.log

exit 0