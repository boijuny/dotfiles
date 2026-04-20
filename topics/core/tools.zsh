# Homebrew (macOS Apple Silicon)
[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# fzf keybindings (Ctrl+R for history, Ctrl+T for files)
[[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
[[ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]] && source /opt/homebrew/opt/fzf/shell/completion.zsh
# Linux fzf
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh

# zoxide (smart cd)
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# Prompt
command -v starship >/dev/null && eval "$(starship init zsh)"
