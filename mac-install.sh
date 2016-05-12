#!/bin/bash

xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL
https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install cmake
brew install python3

brew install tree
brew install cloc
brew install htop
brew install nload
brew install tmux
brew install nmap
brew install sqlmap
brew install apache2-utils
brew install graphviz
brew install homebrew/science/opencv
