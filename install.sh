#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

for f in .??*
do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    ln -snfv "$f" ~/"$f"
done
#For vim
#neobundleのインストール
if [ ! -e ~/.vim/bundle ] ; then
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi

#For zsh
#oh-my-zshのインストール
curl -L http://install.ohmyz.sh | sh

