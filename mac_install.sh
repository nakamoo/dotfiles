#!/bin/bash

echo " --------- Homebrew ----------"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew -v
echo " ------------ END ------------"

brew tap Homebrew/bundle
brew install cask
brew install mas

