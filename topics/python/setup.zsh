# Conda initialize
export CONDA_CHANGEPS1=false
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

# Conda
alias ca="conda activate"
alias cd="conda deactivate"
alias cl="conda env list"

# Python
alias p="python"
alias pi="pip install"

# UV (Fast Python Tooling)
alias u="uv"
alias ui="uv init"
alias ua="uv add"
alias ur="uv run"
alias ux="uvx"
