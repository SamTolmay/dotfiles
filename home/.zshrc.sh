#!/usr/bin/env zsh

# Commonly used directories.
DEV="$HOME/Developer"
SAM="$DEV/sam"
LDF="$DEV/lowdefy"
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
alias py='python3'
alias actenv='source env/bin/activate'
alias nb='jupyter notebook'
alias cl='clear'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/bin:$HOME/.yarn/bin:$PATH"

# export MONGOMS_ARCH="x64"
