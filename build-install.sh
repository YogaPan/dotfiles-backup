#!/bin/bash

# Install build-essential.
sudo apt-get update
sudo apt-get install gcc g++ make cmake
sudo apt-get install gdb valgrind
sudo apt-get install libssl-dev libncurses5-dev
sudo apt-get install software-properties-common

# For perf
sudo apt-get install linux-tools-common
sudo apt-get install linux-tools-`uname -r` linux-cloud-tools-`uname -r`

# Install mail-utils.
sudo apt-get install mutt esmtp

# For coding sytle and document.
sudo apt-get install astyle
sudo apt-get install doxygen

# Useful tools
sudo apt-get install htop
sudo apt-get install tig
sudo apt-get install cloc
sudo apt-get install tree
sudo apt-get install gnuplot

# pip
sudo apt-get install python-dev python3-dev python-pip python3-pip

# Web Tools
sudo apt-get install nmap
sudo apt-get install apache2-utils
sudo apt-get install vsftpd

sudo pip3 install requests
sudo pip3 install django
sudo pip3 install httpie
