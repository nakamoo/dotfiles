#!/bin/local/zsh
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
path=(
  /usr/local/bin
  $path
)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs..
# eval "$(rbenv init -)"
# alias ctags="`brew --prefix`/bin/ctags"

HISTSIZE=10000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# ディレクトリ移動
setopt AUTO_CD
cdpath=(.. ~ ~/git ~/gitbucket)
DIRSTACKSIZE=100
setopt AUTO_PUSHD

# Path
export PGDATA=/usr/local/var/postgres
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=$PATH:/Library/TeX/texbin
eval "$(pyenv init -)"
# echo "$(pyenv virtualenv-init -)"

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
