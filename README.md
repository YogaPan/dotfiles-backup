# dotfiles

## How to install
```sh
$ git clone https://github.com/YogaPan/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
$ ./install.sh
```

## Setting your git config
```sh
$ git config --global -l | grep -e "^user" -e "^core.editor" # show your settings
$ git config --global user.name "yourname"
$ git config --global user.email "yourmail@example.com"
$ git config --global core.editor vim
```

You can also change git config in ~/gitconfig file.
