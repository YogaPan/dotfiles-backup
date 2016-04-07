#!/bin/bash
# Install build-essential.
sudo apt-get update
sudo apt-get install gcc g++ make cmake
sudo apt-get install gdb valgrind
sudo apt-get install libssl-dev libncurses5-dev
sudo apt-get install software-properties-common

# Install mail-utils.
sudo apt-get install mutt esmtp

# For coding sytle and document.
sudo apt-get install astyle
sudo apt-get install doxygen

sudo apt-get install htop
sudo apt-get install tig
sudo apt-get install cloc
sudo apt-get install tree

# pip
sudo apt-get install python-dev python3-dev python-pip python3-pip

# Python web
sudo pip3 install requests
sudo pip3 install django
