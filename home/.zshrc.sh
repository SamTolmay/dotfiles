#!/usr/bin/env zsh

# Commonly used directories.
DEV="$HOME/Developer"
SAM="$DEV/sam"
LDF="$DEV/lowdefy"
MRM="$DEV/techmrm"
MSC="$SAM/msc"
# Load main files.
# echo "Load start\t" $(gdate "+%s-%N")
source "$SAM/dotfiles/terminal/startup.sh"
# echo "Load end\t" $(gdate "+%s-%N")

# autoload -U colors && colors

# Load and execute the prompt theming system.
fpath=("$SAM/dotfiles/terminal" $fpath)
autoload -Uz promptinit && promptinit
prompt 'paulmillr'

# ==================================================================
# = Aliases =
# ==================================================================
alias ldf='lowdefy'
alias yn='yarn'
alias ynb='yarn build'
alias yns='yarn start'
alias ynt='yarn test'
alias ynd='yarn dev'
alias py='python3'
alias actenv='source env/bin/activate'
alias nb='jupyter notebook'
alias cl='clear'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/bin:$HOME/.yarn/bin:$PATH"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/sam/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/sam/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/sam/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/sam/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export MONGOMS_ARCH="x64"
