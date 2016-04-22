#!/bin/bash

sudo apt-get install fcitx -y
sudo apt-get install guake -y
sudo apt-get install fonts-hack-ttf -y
sudo apt-get install flashplugin-installer -y

sudo apt-get install unity-tweak-tool -y
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme-circle numix-gtk-theme -y

sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install pulseaudio-equalizer -y

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub \
  | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ \
  stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update 
sudo apt-get install google-chrome-stable -y

# In /usr/share/X11/xkb/symbols/pc
#
# key <LSGT> {    [ less, greater, bar, brokenbar  ]  };
# key <LSGT> { [ grave, asciitilde, grave, asciitilde  ]  };
