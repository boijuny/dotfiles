# dotfiles

## Setup

```bash
git clone <repo-url> ~/code/dotfiles
cd ~/code/dotfiles
./install.sh
```

This installs packages (Homebrew/apt/dnf) and symlinks configs to `$HOME`.

## What's included

- `.zshrc` — aliases, fzf, zoxide, conda
- `.gitconfig` — aliases (`gs`, `gl`, `gd`, `ga`, `gc`, `gp`), rebase on pull, diff3 merge
- `.gitignore_global` — .DS_Store, .env, __pycache__, .vscode
- `Brewfile` — curated dev tools (macOS)
- `install.sh` — cross-platform installer (macOS, Debian, RHEL)

## Adding a tool

1. `brew install <tool>`
2. Add `brew "<tool>"` to `Brewfile`
3. Commit
