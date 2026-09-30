# Global Rules

## Language

- The user communicates in Russian. Always respond in Russian.
- Code, identifiers, and technical terms stay in their original language (English).

## Code comments

- Comments must be minimal: only necessary and sufficient explanations.
- No ASCII art decorations: no banners of `=====`, `-----`, `*****`, `###`, no box-drawing characters, no decorative separator lines.
- Use only the native comment syntax of the programming language: `//` and `/* */` (JS/TS/Go/Rust), `#` (Python/Shell/YAML), `--` (SQL/Haskell), `%` (Matlab/LaTeX), `REM` (Batch), `;` (Lisp/Clojure).
- Don't repeat what the code obviously does; comment the why, not the what.

## Secrets

- Never read, display, copy, or transmit secret material: `~/.ssh/*` (private keys, `known_hosts`, `config.local`), credential files, `.env` files, API keys, tokens. Treat these as forbidden regardless of tool.

## Git

- Never mutate git repository state on your own: `git commit`, `git push`, `git pull`, `git merge`, `git rebase`, `git cherry-pick`, `git revert`, `git reset`, `git tag`, `git branch`, `git checkout`, `git switch`, `git restore`, `git stash`, `git clean`, `git remote`, `git worktree`, `git submodule`, `git rm` — only when the user explicitly asks.
- Read-only commands (`git status`, `git diff`, `git log`, `git show`, `git fetch`, `git blame`) are allowed without asking.
