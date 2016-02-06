#!/usr/bin/env bash

echo -n "Checking for Xcode select: "
if ! sh -c "xcode-select -p"; then
    sh -c "xcode-select --install"
    exit
fi

echo -n "Checking for Homebrew: "
if ! command -v brew; then
    echo "No Homebrew installed."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -n "Checking for Oh-My-Zsh: "
if [ -e ~/.oh-my-zsh/ ]; then
    echo "~/.oh-my-zsh"
else
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo -n "Checking for zsh-syntax-hightlighting"
if [ -e ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    echo "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
else
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

echo -n "Checking for .zshrc: "
if [ -e ~/.zshrc ]; then
    echo "~/.zshrc"
    echo -n ".zshrc existed. Do you want to delete this file? (y/n) "
    read yn
    case $yn in
        [Yy]* ) ln -sf ~/dotfiles/.zshrc ~/.zshrc;;
        * ) exit
    esac
else
    echo "No .zshrc file."
    ln -s ~/dotfiles/.zshrc ~/.zshrc
fi

echo -n "Checking for macvim: "
if ! command -v mvim; then
    echo "No macvim installed."
    brew install macvim
fi

echo -n "Checking for .vimrc: "
if [ -e ~/.vimrc ]; then
    echo "~/.vimrc"
    echo -n ".vimrc existed. Do you want to delete this file? (y/n) "
    read yn
    case $yn in
        [Yy]* ) ln -sf ~/dotfiles/.vimrc ~/.vimrc;;
        * ) exit
    esac
else
    ln -sf ~/dotfiles/.vimrc ~/.vimrc
fi

echo -n ""

echo -n "Checking for .mvimrc: "
if [ -e ~/.mvimrc ]; then
    echo "~/.mvimrc"
    echo -n ".mvimrc existed. Do you want to delete this file? (y/n) "
    read yn
    case $yn in
        [Yy]* ) ln -sf ~/dotfiles/.mvimrc ~/.mvimrc;;
        * ) exit
    esac
else
    ln -s ~/dotfiles/.mvimrc ~/.mvimrc;
fi

echo -n "Checking for Ag: "
if ! command -v ag; then
    echo "Ag not exist."
    brew install the_silver_searcher
fi

echo -n "Check for Vundle"
if [ -e ~/.vim/bundle/Vundle.vim ]; then
    echo "~/.vim/bundle/Vundle.vim"
else
    echo "No vundle installed."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo -n "Check Source Code font: "
if [ -e ~/fonts ]; then
    echo "~/fonts"
else
    echo "No fonts installed."
    git clone https://github.com/powerline/fonts.git ~/fonts
    cd ~/fonts/
    ./install.sh
    cd -
fi

vim +PluginInstall +qall
echo "done"
