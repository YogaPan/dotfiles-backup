# dotfiles

## Prepare
```sh
$ sudo passwd yourname
$ sudo apt-get update
$ sudo apt-get install git
```

## How to install
```sh
$ git clone https://github.com/YogaPan/dotfiles.git ~/dotfiles
$ cd ~/dotfiles && ./zsh-install.sh ./vim-install.sh ./build-install.sh
```

```sh
$ cp .esmtprc .muttrc .gitconfig ~/
$ chmod 600 ~/.esmtprc ~/.muttrc
$ vim ~/.esmtprc ~/.muttrc ~/.gitconfig
```
