# Install build-essential.
sudo apt-get update
sudo apt-get install gcc g++ make cmake
sudo apt-get install gdb valgrind
sudo apt-get install libssl-dev libncurses5-dev
sudo apt-get install software-properties-common

# For coding sytle and document.
sudo apt-get install astyle
sudo apt-get install doxygen

# Install mail-utils.
sudo apt-get install mutt esmtp

# Fancy top.
sudo apt-get install htop

# For git log
sudo apt-get install tig

# pip
sudo apt-get install python-dev python3-dev python-pip python3-pip

# Python web
sudo pip3 install requests
sudo pip3 install django

# Python science
sudo pip3 install numpy
sudo apt-get install python3-matplotlib
sudo apt-get install libblas-dev liblapack-dev libatlas-base-dev gfortran
sudo pip3 install scipy
sudo pip3 install sklearn
