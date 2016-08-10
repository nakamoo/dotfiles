#!/bin/sh -eu

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

cmd_check () {
  if ! type $1 &>/dev/null; then
    echo "$1 don't exist."
    echo "install $1!"
    exit 1
  fi
}

cmd_check git
cmd_check curl
cmd_check zsh
cmd_check tmux

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
  if [[ $rcfile == "README.md" ]]; then
    continue
  fi
  ln -sf $rcfile ~/.${rcfile}
done

if [ ! -e ~/.pyenv ] ; then
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

if [ ! -e ~/.pyenv/plugins/pyenv-virtualenv ] ; then
  git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
fi

#dotfiles
echo "make synbolic link..."
ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/.vimrc ~/.ideavimrc
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc
[ -f ~/.zshrc.local ] && ln -sf $DOTFILES_DIR/.zshrc.local ~/.zshrc.local
ln -sf $DOTFILES_DIR/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES_DIR/.zpreztorc ~/.zpreztorc
ln -sf $DOTFILES_DIR/.gitignore_global ~/.gitignore_global
[ -f $DOTFILES_DIR/.zshrc.local ] && ln -sf $DOTFILES_DIR/.zshrc.local ~/.zshrc.local


echo "change login shell to zsh"
chsh -s /bin/zsh
