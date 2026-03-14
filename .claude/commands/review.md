---
description: Review the latest changes for bugs, security issues, and code quality
allowed-tools: Bash(git diff:*), Bash(git log:*), Read, Glob
---

## Files Changed
!`git diff --name-only HEAD~1`

## Full Diff
!`git diff HEAD~1`

---

Review the above diff and report on the following — be concise and direct:

**Bugs** — logic errors, off-by-one, null handling, wrong conditions  
**Security** — exposed secrets, injection risks, unsafe inputs, missing auth checks  
**Code quality** — dead code, duplicated logic, naming that misleads  
**Missing tests** — critical paths not covered

Format your output as:

```
🐛 BUGS
- ...

🔒 SECURITY
- ...

🧹 QUALITY
- ...

✅ TESTS NEEDED
- ...
```

If a category has no issues, write "None found."  
Do not comment on formatting or style unless it causes a real problem.
