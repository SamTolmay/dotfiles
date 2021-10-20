#!/bin/sh

dotfiles="$HOME/Developer/sam/dotfiles/home"

link "$dotfiles/.gitconfig" "$HOME/.gitconfig"
link "$dotfiles/.zlogin.sh" "$HOME/.zlogin"
link "$dotfiles/.zshenv.sh" "$HOME/.zshenv"
link "$dotfiles/.zshrc.sh" "$HOME/.zshrc"


