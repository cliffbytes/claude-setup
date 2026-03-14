---
description: Scan the codebase for TODO, FIXME, and HACK comments and list them
allowed-tools: Bash(grep:*), Bash(find:*)
---

Scan the project for all leftover annotations using:

```
grep -rn "TODO\|FIXME\|HACK\|XXX\|BUG\|TEMP" \
  --include="*.c" --include="*.h" --include="*.py" --include="*.js" \
  --include="*.ts" --include="*.go" --include="*.rs" \
  --exclude-dir=".git" --exclude-dir="node_modules" --exclude-dir="vendor" \
  .
```

Group and present the results as a table:

| File | Line | Type | Note |
|------|------|------|------|
| ... | ... | TODO | ... |

Then give a short summary:
- Total count by type (TODO, FIXME, HACK, etc.)
- Top 3 most urgent items based on context
- Any that look like security or correctness risks
