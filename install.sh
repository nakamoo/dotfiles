#!/bin/sh -eu

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

#For vim
#neobundleのインストール
if [ ! -e ~/.vim/bundle ] ; then
  echo "neobundle is not installed!"
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
  echo "neobundle is installed!"
fi

#For zsh
#Preztoのインストール
if [ ! -e ~/.zprezto ] ; then
  echo "Prezto is not installed!"
  zsh
  cd && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
  echo "Prezto is installed!"
else
  echo "Update Prezto!"
  cd ~/.zprezto && git pull && git submodule update --init --recursive
fi

echo "make synbolic link..."
ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc
