#!/bin/bash

# Read JSON input
input=$(cat)

# Extract basic info
model=$(echo "$input" | jq -r '.model.display_name')
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
dir=$(basename "$cwd")

# SSH info
ssh=""
[ -n "$SSH_TTY" ] && ssh="$(whoami)@$(hostname -s) "

# Git info
vcs=""
cd "$cwd" 2>/dev/null && git rev-parse --is-inside-work-tree &>/dev/null && {
    ref=$(git symbolic-ref -q HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
    [ -n "$ref" ] && {
        git diff --quiet --ignore-submodules HEAD 2>/dev/null && dirty="" || dirty="*"
        upstream=""
        counts=$(git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
        if [ -n "$counts" ]; then
            ahead=$(echo "$counts" | cut -f1)
            behind=$(echo "$counts" | cut -f2)
            [ "$ahead" -gt 0 ] 2>/dev/null && upstream+="↑${ahead}"
            [ "$behind" -gt 0 ] 2>/dev/null && upstream+="↓${behind}"
        fi
        vcs=" ${ref}${dirty}${upstream}"
    }
}

# Token counts
in_tok=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
out_tok=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
remaining_pct=$(echo "$input" | jq -r '.context_window.remaining_percentage // 0')

# Color codes
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
MAGENTA='\033[35m'
BLUE='\033[34m'
GREY='\033[2;37m'  # Dim grey for token counts
RESET='\033[0m'

# Choose color for context remaining based on percentage
if (( $(echo "$remaining_pct > 50" | bc -l) )); then
    CONTEXT_COLOR="$GREEN"
elif (( $(echo "$remaining_pct > 20" | bc -l) )); then
    CONTEXT_COLOR="$YELLOW"
else
    CONTEXT_COLOR='\033[31m'  # Red for low context
fi

# Output format with colors
printf "${CYAN}%s${RESET} | ${BLUE}%s%s${RESET}${MAGENTA}%s${RESET} | ${GREY}↑%sk${RESET} ${GREY}↓%sk${RESET} ${CONTEXT_COLOR}%s%% left${RESET}" \
    "$model" "$ssh" "$dir" "$vcs" \
    "$((in_tok/1000))" "$((out_tok/1000))" "$remaining_pct"
