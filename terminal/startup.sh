#
# Initializes Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>


#
# Sets directory options and defines directory aliases.
#
# Authors:
#   James Cox <james@imaj.es>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Options
#

setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>.
                            # Use >! and >>! to bypass.

#
# Sets general shell options and defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#


#
# General
#

setopt COMBINING_CHARS    # Combine zero-length punctuation characters (accents)
                          # with the base character.
setopt RC_QUOTES          # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.

#
# Jobs
#

setopt LONG_LIST_JOBS     # List jobs in the long format by default.
setopt AUTO_RESUME        # Attempt to resume existing job before creating a new process.
setopt NOTIFY             # Report status of background jobs immediately.



#
# Sets history options and defines history aliases.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Variables
#

HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"       # The path to the history file.
HISTSIZE=1000                   # The maximum number of events to save in the internal history.
SAVEHIST=1000                   # The maximum number of events to save in the history file.

#
# Options
#

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.

# Correct commands.
setopt CORRECT


#
# Provides for easier use of 256 colors and effects.
#
# Authors:
#   P.C. Shyamshankar <sykora@lucentbeing.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
# if [[ "$TERM" == 'dumb' ]]; then
#   return 1
# fi

# typeset -gA FX FG BG

# FX=(
#                                         none                         "\e[00m"
#                                         normal                       "\e[22m"
#   bold                      "\e[01m"    no-bold                      "\e[22m"
#   faint                     "\e[02m"    no-faint                     "\e[22m"
#   standout                  "\e[03m"    no-standout                  "\e[23m"
#   underline                 "\e[04m"    no-underline                 "\e[24m"
#   blink                     "\e[05m"    no-blink                     "\e[25m"
#   fast-blink                "\e[06m"    no-fast-blink                "\e[25m"
#   reverse                   "\e[07m"    no-reverse                   "\e[27m"
#   conceal                   "\e[08m"    no-conceal                   "\e[28m"
#   strikethrough             "\e[09m"    no-strikethrough             "\e[29m"
#   gothic                    "\e[20m"    no-gothic                    "\e[22m"
#   double-underline          "\e[21m"    no-double-underline          "\e[22m"
#   proportional              "\e[26m"    no-proportional              "\e[50m"
#   overline                  "\e[53m"    no-overline                  "\e[55m"

#                                         no-border                    "\e[54m"
#   border-rectangle          "\e[51m"    no-border-rectangle          "\e[54m"
#   border-circle             "\e[52m"    no-border-circle             "\e[54m"

#                                         no-ideogram-marking          "\e[65m"
#   underline-or-right        "\e[60m"    no-underline-or-right        "\e[65m"
#   double-underline-or-right "\e[61m"    no-double-underline-or-right "\e[65m"
#   overline-or-left          "\e[62m"    no-overline-or-left          "\e[65m"
#   double-overline-or-left   "\e[63m"    no-double-overline-or-left   "\e[65m"
#   stress                    "\e[64m"    no-stress                    "\e[65m"

#                                         font-default                 "\e[10m"
#   font-first                "\e[11m"    no-font-first                "\e[10m"
#   font-second               "\e[12m"    no-font-second               "\e[10m"
#   font-third                "\e[13m"    no-font-third                "\e[10m"
#   font-fourth               "\e[14m"    no-font-fourth               "\e[10m"
#   font-fifth                "\e[15m"    no-font-fifth                "\e[10m"
#   font-sixth                "\e[16m"    no-font-sixth                "\e[10m"
#   font-seventh              "\e[17m"    no-font-seventh              "\e[10m"
#   font-eigth                "\e[18m"    no-font-eigth                "\e[10m"
#   font-ninth                "\e[19m"    no-font-ninth                "\e[10m"
# )

# FG[none]="$FX[none]"
# BG[none]="$FX[none]"
# colors=(black red green yellow blue magenta cyan white)
# for color in {0..255}; do
#   if (( $color >= 0 )) && (( $color < $#colors )); then
#     index=$(( $color + 1 ))
#     FG[$colors[$index]]="\e[38;5;${color}m"
#     BG[$colors[$index]]="\e[48;5;${color}m"
#   fi

#   FG[$color]="\e[38;5;${color}m"
#   BG[$color]="\e[48;5;${color}m"
# done
# unset color{s,} index


#
# Defines general aliases and functions.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Suraj N. Kurapati <sunaku@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#





# Checks if a name is a command, function, or alias.
# function is-callable {
#   (( $+commands[$1] )) || (( $+functions[$1] )) || (( $+aliases[$1] ))
# }

# if is-callable 'dircolors'; then
#   # GNU Core Utilities
#   alias ls='ls --group-directories-first'

#   if zstyle -t ':prezto:module:utility:ls' color; then
#     if [[ -s "$HOME/.dir_colors" ]]; then
#       eval "$(dircolors "$HOME/.dir_colors")"
#     else
#       eval "$(dircolors)"
#     fi

#     alias ls="$aliases[ls] --color=auto"
#   else
#     alias ls="$aliases[ls] -F"
#   fi
# else
#   # BSD Core Utilities
#   if zstyle -t ':prezto:module:utility:ls' color; then
#     # Define colors for BSD ls.
#     export LSCOLORS='exfxcxdxbxGxDxabagacad'

#     # Define colors for the completion system.
#     export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

#     alias ls='ls -G'
#   else
#     alias ls='ls -F'
#   fi
# fi


