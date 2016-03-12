#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

#For vim
#neobundleのインストール
if [ ! -e ~/.vim/bundle ] ; then
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi

#For zsh
#Preztoのインストール
if [ ! -e ~/.zprezto ] ; then
  zsh
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
else
  cd ~/.zprezto && git pull && git submodule update --init --recursive
fi

ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc
