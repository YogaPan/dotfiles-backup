#!/bin/sh

# Detect operating system
operating_system=`uname`

if [ $operating_system = "Darwin" ]; then
  echo "Install Mac os dependencies...\n"
  brew install node
	npm install -g bower
	npm install -g speed-test
	npm install -g gulp
	npm install -g live-server
	rm -rf ~/.tldr
	mkdir ~/.tldr
	npm install -g tldr
fi

if [ $operating_system = "Linux" ]; then
  echo "Install Linux dependencies...\n"
  sudo apt-get install curl -y
  curl --silent --location https://deb.nodesource.com/setup_6.x | sudo bash -
  sudo apt-get install nodejs -y
	sudo npm install -g bower
	sudo npm install -g speed-test
	sudo npm install -g gulp
	sudo npm install -g live-server
	sudo rm -rf ~/.tldr
	mkdir ~/.tldr
	sudo npm install -g tldr
fi

