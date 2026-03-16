#!/bin/sh

dotfiles="$HOME/Developer/sam/dotfiles/home"

ln -sf "$dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -sf "$dotfiles/.zlogin.sh" "$HOME/.zlogin"
ln -sf "$dotfiles/.zshenv.sh" "$HOME/.zshenv"
ln -sf "$dotfiles/.zshrc.sh" "$HOME/.zshrc"

mkdir -p "$HOME/.claude"
ln -sf "$dotfiles/.claude/settings.json" "$HOME/.claude/settings.json"
ln -sf "$dotfiles/.claude/statusline.sh" "$HOME/.claude/statusline.sh"
