#!/usr/bin/env zsh

# Directories
DEV="$HOME/Developer"
SAM="$DEV/sam"
MRM="$DEV/mrm"
MRMS="$MRM/mrm-support"
PRP="$MRM/prp"
LOW="$DEV/lowdefy"
LDF="$LOW/lowdefy"
LDFA="$LOW/lowdefy.worktrees/lowdefy-alpha"
LDD="$LOW/lowdefy-design"
LDDA="$LOW/lowdefy-design.worktrees/design-alpha"

# Shell options and history.
source "$SAM/dotfiles/terminal/startup.sh"

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # case-insensitive
zstyle ':completion:*' menu select                     # arrow-key menu

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
alias ccupdate='brew upgrade claude-code@latest'
killport() { kill -9 $(lsof -ti:"$1") }

# PATH
export PATH="/opt/homebrew/opt/python@3.14/libexec/bin:/opt/homebrew/bin:$HOME/.yarn/bin:$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# nvm — canonical install per nvm's README. Sourcing nvm.sh auto-runs
# `nvm use default` (via nvm.sh's nvm_process_parameters), so node/pnpm
# land on PATH.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

