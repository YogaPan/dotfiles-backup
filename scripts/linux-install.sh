#!/bin/bash

# Install build-essential.
# sudo apt-get install software-properties-common
apt-get update
apt-get install build-essential -y
apt-get install cmake
apt-get install gdb valgrind -y
apt-get install libssl-dev libncurses5-dev -y

# For perf
apt-get install linux-tools-common -y
apt-get install linux-tools-`uname -r` linux-cloud-tools-`uname -r` -y

# For coding sytle and document.
apt-get install astyle -y
apt-get install doxygen -y
apt-get install graphviz -y

# For opencv
apt-get install libopencv-lib -y
apt-get install python-opencv -y
# http://milq.github.io/install-opencv-ubuntu-debian/

# Useful tools
apt-get install tmux -y
apt-get install htop -y
apt-get install nload -y
apt-get install tig -y
apt-get install cloc -y
apt-get install tree -y
apt-get install gnuplot -y

# Web Tools
apt-get install nginx -y
apt-get install vsftpd -y

sudo apt-get install apache2-utils -y
sudo add-apt-repository ppa:wireshark-dev/stable -y
sudo apt-get update && sudo apt-get install wireshark -y
sudo apt-get install nmap -y
sudo apt-get install sqlmap -y

# Install mail-utils.
sudo apt-get install mutt esmtp -y
