#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc

#For vim
#neobundleのインストール
if [ ! -e ~/.vim/bundle ] ; then
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi

#For zsh
#Preztoのインストール
if [ ! -e ~/.zprezto ] ; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
else
  cd ~/.zprezto && git pull && git submodule update --init --recursive
fi
