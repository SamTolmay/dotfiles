#!/usr/bin/env zsh

# Commonly used directories.
DEV="$HOME/Developer"
SAM="$DEV/sam"
LDF="$DEV/lowdefy/lowdefy"
MRM="$DEV/mrm"
PRP="$MRM/prp"

# Shell options and history.
source "$SAM/dotfiles/terminal/startup.sh"

# Prompt
source "$SAM/dotfiles/terminal/prompt.zsh"

# Auto-list files on cd
function chpwd { ls -G . }

# Aliases
alias ldf='lowdefy'
alias py='python3'
alias python='python3'
alias actenv='source env/bin/activate'
alias nb='jupyter notebook'
alias cl='clear'
alias cc=claude
alias gem=gemini
alias ccupdate='brew upgrade claude-code'
killport() { kill -9 $(lsof -ti:"$1") }

# PATH
export PATH="/opt/homebrew/opt/python@3.14/libexec/bin:/opt/homebrew/bin:$HOME/.yarn/bin:$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Lazy-load nvm (saves ~200ms shell startup)
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  nvm() {
    unset -f nvm node npm npx
    \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
  }
  node() { unset -f nvm node npm npx; \. "$NVM_DIR/nvm.sh"; node "$@" }
  npm()  { unset -f nvm node npm npx; \. "$NVM_DIR/nvm.sh"; npm "$@" }
  npx()  { unset -f nvm node npm npx; \. "$NVM_DIR/nvm.sh"; npx "$@" }
fi
