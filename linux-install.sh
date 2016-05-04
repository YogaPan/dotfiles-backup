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
sudo apt-get install tmux -y
sudo apt-get install htop -y
sudo apt-get install nload -y
sudo apt-get install tig -y
sudo apt-get install cloc -y
sudo apt-get install tree -y
sudo apt-get install gnuplot -y

# Web Tools
sudo apt-get install nginx -y
sudo apt-get install vsftpd -y

sudo apt-get install apache2-utils -y
sudo add-apt-repository ppa:wireshark-dev/stable -y
sudo apt-get update && sudo apt-get install wireshark -y
sudo apt-get install nmap -y
sudo apt-get install sqlmap -y

# Install mail-utils.
sudo apt-get install mutt esmtp -y