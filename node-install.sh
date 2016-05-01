#!/bin/sh

# Detect operating system
operating_system=`uname`

if [ $operating_system = "Darwin" ]; then
  echo "Install Mac os dependencies...\n"
  brew install node
fi

if [ $operating_system = "Linux" ]; then
  echo "Install Linux dependencies...\n"
  apt-get install curl -y
  curl --silent --location https://deb.nodesource.com/setup_5.x | sudo bash -
  apt-get install nodejs -y
fi

npm install -g bower
npm install -g speed-test
npm install -g gulp
npm install -g live-server

rm -rf ~/.tldr
mkdir ~/.tldr
npm install -g tldr
