#!/usr/bin/env zsh

# Commonly used directories.
DEV="$HOME/Developer"
SAM="$DEV/sam"
LDF="$DEV/lowdefy/lowdefy"
MRM="$DEV/mrm"
PRP="$MRM/prp"



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
alias py='python3'
alias actenv='source env/bin/activate'
alias nb='jupyter notebook'
alias cl='clear'
alias killport3000='kill -9 $(lsof -ti:3000)'
alias cc=claude
alias gem=gemini
alias python='python3'


export PATH="/opt/homebrew/opt/python@3.14/libexec/bin:/opt/homebrew/bin:$HOME/.yarn/bin:$PATH::/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
