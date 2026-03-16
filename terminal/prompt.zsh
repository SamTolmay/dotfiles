# Simple zsh prompt.
#
# dotfiles ❯ (default)
# dotfiles master ❯ (in git repository)
# dotfiles master↑2↓1 ❯ (ahead/behind remote)
# dotfiles master* ❯ (dirty working tree)
# dotfiles master 3s ❯ (last command took >5s)
#
# Based on prompt by Paul Miller (paulmillr.com)

zmodload zsh/datetime
autoload -Uz add-zsh-hook

vcs_info=''
cmd_exec_time=''
cmd_start_time=''
prompt_dir=''

function prompt_preexec {
  cmd_start_time=$EPOCHSECONDS
}

function prompt_precmd {
  # Command execution time (show if >5s)
  cmd_exec_time=''
  if [[ -n "$cmd_start_time" ]]; then
    local elapsed=$(( EPOCHSECONDS - cmd_start_time ))
    if (( elapsed >= 5 )); then
      if (( elapsed >= 3600 )); then
        cmd_exec_time=" %F{yellow}$((elapsed / 3600))h$((elapsed % 3600 / 60))m$((elapsed % 60))s%f"
      elif (( elapsed >= 60 )); then
        cmd_exec_time=" %F{yellow}$((elapsed / 60))m$((elapsed % 60))s%f"
      else
        cmd_exec_time=" %F{yellow}${elapsed}s%f"
      fi
    fi
  fi
  cmd_start_time=''

  # Current directory (~ for home)
  if [[ "$PWD" == "$HOME" ]]; then
    prompt_dir='~'
  else
    prompt_dir="${PWD:t}"
  fi

  # Git info
  vcs_info=''
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local ref=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')
  if [[ -n "$ref" ]]; then
    local dirty=$(git diff --quiet --ignore-submodules HEAD 2>/dev/null; [ $? -eq 1 ] && echo '*')

    local upstream=""
    local counts=$(git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
    if [[ -n "$counts" ]]; then
      local ahead=${counts%%$'\t'*}
      local behind=${counts##*$'\t'}
      (( ahead > 0 )) && upstream+="↑${ahead}"
      (( behind > 0 )) && upstream+="↓${behind}"
    fi

    vcs_info=" %F{magenta}${ref}${dirty}${upstream}%f"
  fi
}

setopt PROMPT_SUBST
add-zsh-hook preexec prompt_preexec
add-zsh-hook precmd prompt_precmd

PROMPT='%F{cyan}${prompt_dir}%f${vcs_info}${cmd_exec_time} %(!.%B%F{red}#%f%b.%B%(?.%F{green}.%F{red})❯%f%b) '
RPROMPT=''
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

