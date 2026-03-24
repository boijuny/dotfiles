# --- Homebrew (macOS Apple Silicon) ---
[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# --- Conda ---
# >>> conda initialize >>>
__conda_setup="$("$HOME/miniforge3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# --- PATH ---
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# --- Aliases ---
alias g="git"
alias gs="git status -sb"
alias gl="git log --oneline -15"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpl="git pull"

alias ls="eza 2>/dev/null || ls"
alias ll="eza -la --git 2>/dev/null || ls -la"
alias cat="bat --style=plain 2>/dev/null || cat"

alias c="cursor ."
alias py="python"

# --- Tools ---
# fzf keybindings (Ctrl+R for history, Ctrl+T for files)
[[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
[[ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]] && source /opt/homebrew/opt/fzf/shell/completion.zsh
# Linux fzf
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh

# zoxide (smart cd)
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# --- Prompt ---
command -v starship >/dev/null && eval "$(starship init zsh)"

# --- Knowledge capture ---
til() { echo "- $(date +%H:%M) $*" >> ~/Documents/daily/$(date +%Y-%m-%d).md }
