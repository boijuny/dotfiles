#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install packages
if [[ "$(uname)" == "Darwin" ]]; then
    command -v brew >/dev/null || { echo "Install Homebrew first: https://brew.sh"; exit 1; }
    brew bundle --file="$DOTFILES_DIR/Brewfile"
elif [[ -f /etc/debian_version ]]; then
    sudo apt update && sudo apt install -y git gh fzf ripgrep fd-find bat eza zoxide jq tldr htop
elif [[ -f /etc/redhat-release ]]; then
    sudo dnf install -y git gh fzf ripgrep fd-find bat eza zoxide jq tldr htop
fi

# Symlink configs
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"

echo "Done. Restart your shell."
