#!/usr/bin/env zsh

# Commonly used directories.
DEV="$HOME/Developer"
SAM="$DEV/sam"
LDF="$DEV/lowdefy"
# Load main files.
# echo "Load start\t" $(gdate "+%s-%N")
source "$SAM/dotfiles/terminal/startup.sh"
# echo "$curr/terminal/startup.sh"
source "$SAM/dotfiles/terminal/completion.sh"
source "$SAM/dotfiles/terminal/highlight.sh"
# echo "Load end\t" $(gdate "+%s-%N")

autoload -U colors && colors

# Load and execute the prompt theming system.
fpath=("$SAM/dotfiles/terminal" $fpath)
autoload -Uz promptinit && promptinit
prompt 'paulmillr'

# ==================================================================
# = Aliases =
# ==================================================================
# My own aliases
alias ldf='lowdefy'
alias yn='yarn'
alias ynb='yarn build'
alias yns='yarn start'
alias ynt='yarn test'
alias py='python3'
alias actenv='source env/bin/activate'
alias nb='jupyter notebook'
# Simple clear command.
alias cl='clear'


# Some MacOS-only stuff.
if [[ "$OSTYPE" == darwin* ]]; then
  # Short-cuts for copy-paste.
  alias c='pbcopy'
  alias p='pbpaste'
  # Lock current session and proceed to the login screen.
  alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

  # # Sniff network info.
  # alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
fi



# ===============
# Dev short-cuts.
# ===============

# $ git log --no-merges --pretty=format:"%ae" | stats
# # => 514 a@example.com
# # => 200 b@example.com
# alias stats='sort | uniq -c | sort -r'
# # Lists the ten most used commands.
# alias history-stats="history 0 | awk '{print \$2}' | stats | head"

# # Checks whether connection is up.
# alias net="ping google.com | grep -E --only-match --color=never '[0-9\.]+ ms'"

# ==================================================================
# = Functions =
# ==================================================================
# # Opens file in EDITOR.
# function edit() {
#   local dir=$1
#   [[ -z "$dir" ]] && dir='.'
#   $EDITOR $dir
# }
# alias e=edit

# Execute commands for each file in current directory.
# function each() {
#   for dir in *; do
#     # echo "${dir}:"
#     cd $dir
#     $@
#     cd ..
#   done
# }

# Find files and exec commands at them.
# $ find-exec .coffee cat | wc -l
# # => 9762
# function find-exec() {
#   find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
# }

# Better find(1)
# function ff() {
#   find . -iname "*${1:-}*"
# }

# function _calcram() {
#   local sum
#   sum=0
#   for i in `ps aux | grep -i "$1" | grep -v "grep" | awk '{print $6}'`; do
#     sum=$(($i + $sum))
#   done
#   sum=$(echo "scale=2; $sum / 1024.0" | bc)
#   echo $sum
# }

# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM
# function ram() {
#   local sum
#   local app="$1"
#   if [ -z "$app" ]; then
#     echo "First argument - pattern to grep from processes"
#     return 0
#   fi

#   sum=$(_calcram $app)
#   if [[ $sum != "0" ]]; then
#     echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM"
#   else
#     echo "No active processes matching pattern '${fg[blue]}${app}${reset_color}'"
#   fi
# }

# Same, but tracks RAM usage in realtime. Will run until you stop it.
# $ rams safari
# function rams() {
#   local sum
#   local app="$1"
#   if [ -z "$app" ]; then
#     echo "First argument - pattern to grep from processes"
#     return 0
#   fi

#   while true; do
#     sum=$(_calcram $app)
#     if [[ $sum != "0" ]]; then
#       echo -en "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM\r"
#     else
#       echo -en "No active processes matching pattern '${fg[blue]}${app}${reset_color}'\r"
#     fi
#     sleep 1
#   done
# }


# Shortcut for searching commands history.
# hist git
# alias hist='history 0 | grep'

# 4 lulz.
# function compute() {
#   while true; do head -n 100 /dev/urandom; sleep 0.1; done \
#     | hexdump -C | grep "ca fe"
# }

# Load all CPU cores at once.
# function maxcpu() {
#   cores=$(sysctl -n hw.ncpu)
#   dn=/dev/null
#   i=0
#   while (( i < $((cores)) )); do
#     yes > $dn &
#     (( ++i ))
#   done
#   echo "Loaded $cores cores. To stop: 'killall yes'"
# }

# $ retry ping google.com
# function retry() {
#   echo Retrying "$@"
#   $@
#   sleep 1
#   retry $@
# }
