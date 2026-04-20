alias ls="eza 2>/dev/null || ls"
alias ll="eza -la --git 2>/dev/null || ls -la"
alias cat="bat --style=plain 2>/dev/null || cat"

alias c="cursor ."
alias z="zed ."

# Knowledge capture
til() { echo "- $(date +%H:%M) $*" >> ~/Documents/daily/$(date +%Y-%m-%d).md }
