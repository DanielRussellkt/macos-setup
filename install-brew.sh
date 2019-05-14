#!/usr/bin/env bash

sudo -v

. ./utils/sudo-funcs.sh --source-only

keepAlive

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew already installed"
fi

echo "Updating homebrew"
brew update

echo "Upgrading already installed formulae"
brew upgrade

#Installing brew formulae from txt files in ./installations/brew-formulae
brew install $(awk 1 ./installations/brew-formulae/*.txt)

#Installing brew cask formulae from txt files in ./installations/brew-cask-formulae, and putting shortcuts in applications
brew cask install --appdir="/Applications" $(awk 1 ./installations/brew-cask-formulae/*.txt)

