#!/bin/bash

# Detect operating system
operating_system=`uname`

if [ $operating_system = "Darwin" ]; then
  echo "Install Mac os dependencies...\n"
  brew install python3
  pip3 install matplotlib
fi

if [ $operating_system = "Linux" ]; then
  echo "Install Linux dependencies...\n"
  sudo apt-get install python-dev python3-dev python-pip python3-pip -y
  sudo apt-get install python3-matplotlib -y
fi

# Web tools
pip3 install requests
pip3 install django
pip3 install httpie

# command line tools
pip3 install thefuck

# Python science
pip3 install numpy
pip3 install scipy
pip3 install sklearn
