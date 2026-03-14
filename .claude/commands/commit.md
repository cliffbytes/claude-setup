---
description: Stage all changes and create a conventional commit with a generated message
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git diff:*), Bash(git commit:*)
---

1. Run `git status` and `git diff --staged` to see what has changed.
2. If nothing is staged, run `git add -A` to stage all changes.
3. Analyze the diff and write a commit message following the Conventional Commits format:

   ```
   type(scope): short description

   - bullet explaining what changed
   - bullet explaining why if not obvious
   ```

   Valid types: `feat`, `fix`, `refactor`, `docs`, `style`, `test`, `chore`

4. Run `git commit -m "your message"` with the generated message.
5. Show the commit hash and summary to confirm.

Do not push. Do not create branches. Only commit.
