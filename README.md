# dotfiles

## Setup

```bash
git clone <repo-url> ~/code/dotfiles
cd ~/code/dotfiles
./install.sh
```

This installs packages (Homebrew) and symlinks configs to `$HOME`. 
For a minimal install, you can pass specific topics to `./install.sh`:

```bash
./install.sh core git zsh
```

## Topics

<!-- TOPICS_START -->
| Topic | Features | Tools/Apps |
| :--- | :--- | :--- |
| **apps** |  📦 Brewfile | zed |
| **core** |  📦 Brewfile 🐚 Shell | git, gh, fzf, ripgrep, fd, ... |
| **git** |  🐚 Shell 🔗 Symlinks | Aliases Config |
| **python** |  📦 Brewfile 🐚 Shell | uv |
| **starship** |  🔗 Symlinks |  |
| **zsh** |  🔗 Symlinks |  |
<!-- TOPICS_END -->

## Adding a topic

1. Create a new directory in `topics/`
2. Add a `Brewfile`, `*.zsh`, or `*.symlink`
3. Run `./scripts/update_readme.sh` to update this documentation
