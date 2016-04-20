#!/bin/bash

# Install build-essential.
# sudo apt-get install software-properties-common
sudo apt-get update
sudo apt-get install build-essential -y
sudo apt-get install gdb valgrind -y
sudo apt-get install libssl-dev libncurses5-dev -y

# For perf
sudo apt-get install linux-tools-common -y
sudo apt-get install linux-tools-`uname -r` linux-cloud-tools-`uname -r` -y

# For coding sytle and document.
sudo apt-get install astyle -y
sudo apt-get install doxygen -y

# Useful tools
sudo apt-get install htop -y
sudo apt-get install tig -y
sudo apt-get install cloc -y
sudo apt-get install tree -y
sudo apt-get install gnuplot -y

# pip
sudo apt-get install python-dev python3-dev python-pip python3-pip -y

# Web Tools
sudo apt-get install nmap -y
sudo apt-get install apache2-utils -y
sudo apt-get install vsftpd -y

sudo pip3 install requests
sudo pip3 install django
sudo pip3 install httpie

# Install mail-utils.
sudo apt-get install mutt esmtp -y

