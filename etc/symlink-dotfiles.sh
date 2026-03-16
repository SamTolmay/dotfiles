#!/bin/sh

dotfiles="$HOME/Developer/sam/dotfiles/home"

link "$dotfiles/.gitconfig" "$HOME/.gitconfig"
link "$dotfiles/.zlogin.sh" "$HOME/.zlogin"
link "$dotfiles/.zshenv.sh" "$HOME/.zshenv"
link "$dotfiles/.zshrc.sh" "$HOME/.zshrc"

mkdir -p "$HOME/.claude"
link "$dotfiles/.claude/settings.json" "$HOME/.claude/settings.json"
link "$dotfiles/.claude/statusline.sh" "$HOME/.claude/statusline.sh"
