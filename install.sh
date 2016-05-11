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
  cd ~ && git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
  echo "Prezto is installed!"
else
  echo "Update Prezto!"
  cd ~/.zprezto && git pull && git submodule update --init --recursive
fi

for rcfile in $(ls ~/.zprezto/runcoms); do
  if [ $rcfile == "README.md" ]; then
    continue
  fi
  ln -sf $rcfile ~/.${rcfile:t}
done

if [ ! -e ~/.pyenv] ; then
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

if [ ! -e ~/.pyenv/plugins/pyenv-virtualenv] ; then
  git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
fi

#dotfiles
echo "make synbolic link..."
ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc
ln -sf $DOTFILES_DIR/.zpreztorc ~/.zpreztorc
ln -sf $DOTFILES_DIR/.gitconfig ~/.gitconfig

echo "change login shell to zsh"
chsh -s $(which zsh)
