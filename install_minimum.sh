#!/bin/bash

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

#dotfiles
echo "make synbolic link..."
# ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
# ln -sf $DOTFILES_DIR/.vimrc ~/.ideavimrc
# ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc
# [ -f ~/.zshrc.local ] && ln -sf $DOTFILES_DIR/.zshrc.local ~/.zshrc.local
ln -sf $DOTFILES_DIR/.gitconfig ~/.gitconfig
# ln -sf $DOTFILES_DIR/.tmux.conf ~/.tmux.conf
# ln -sf $DOTFILES_DIR/.zpreztorc ~/.zpreztorc
# ln -sf $DOTFILES_DIR/.gitignore_global ~/.gitignore_global
# [ -f $DOTFILES_DIR/.zshrc.local ] && ln -sf $DOTFILES_DIR/.zshrc.local ~/.zshrc.local

