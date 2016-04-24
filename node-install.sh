#!/bin/sh

curl --silent --location https://deb.nodesource.com/setup_5.x | sudo bash -
sudo apt-get install nodejs -y

sudo npm install -g bower
sudo npm install -g speed-test
sudo npm install -g gulp

rm -rf ~/.tldr
mkdir ~/.tldr
sudo npm install -g tldr
