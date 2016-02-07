#!/usr/bin/env bash
#
# Install My settings into computer.

# Install Xcode.
echo -n "Checking for Xcode select: "
if ! sh -c "xcode-select -p"; then
  sh -c "xcode-select --install"
  exit
fi

# Install Homebrew.
echo -n "Checking for Homebrew: "
if ! command -v brew; then
  echo "No Homebrew installed."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Oh-My-Zsh.
echo -n "Checking for Oh-My-Zsh: "
if [ -e ~/.oh-my-zsh/ ]; then
  echo "~/.oh-my-zsh"
else
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install Zsh-Syntax-Hightlighting.
echo -n "Checking for zsh-syntax-hightlighting"
if [ -e ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
  echo "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
else
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# Check .zshrc file.
echo -n "Checking for .zshrc: "
if [ -e ~/.zshrc ]; then
  echo "~/.zshrc"
  echo -n ".zshrc existed. Do you want to delete this file? (y/n) "
  read yn
  case $yn in
    [Yy]* ) ln -f ~/dotfiles/.zshrc ~/.zshrc ;;
    *     ) exit
  esac
else
  echo "No .zshrc file."
  ln ~/dotfiles/.zshrc ~/.zshrc
fi

# Install fonts.
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

# Create directory for vim backup and swap files.
mkdir -p ~/.vim/{backup_files,swap_files,undo_files}

# Use vundle as vim plugin manager.
echo -n "Check for Vundle: "
if [ -e ~/.vim/bundle/Vundle.vim ]; then
  echo "~/.vim/bundle/Vundle.vim"
else
  echo "No vundle installed."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install macvim.
echo -n "Checking for macvim: "
if ! command -v mvim; then
  echo "No macvim installed."
  brew install macvim
fi

# Check for .vimrc.
echo -n "Checking for .vimrc: "
if [ -e ~/.vimrc ]; then
  echo "~/.vimrc"
  echo -n ".vimrc existed. Do you want to delete this file? (y/n) "
  read yn
  case $yn in
    [Yy]* ) ln -f ~/dotfiles/.vimrc ~/.vimrc ;;
    *     ) exit
  esac
else
  echo "No .vimrc exist."
  ln ~/dotfiles/.vimrc ~/.vimrc
fi

# Install all vim plugins.
vim +PluginInstall +qall

# Check for .gvimrc.
echo -n "Checking for .gvimrc: "
if [ -e ~/.gvimrc ]; then
  echo "~/.gvimrc"
  echo -n ".gvimrc existed. Do you want to delete this file? (y/n) "
  read yn
  case $yn in
    [Yy]* ) ln -f ~/dotfiles/.gvimrc ~/.gvimrc ;;
    *     ) exit
  esac
else
  echo "No .gvimrc exist."
  ln ~/dotfiles/.gvimrc ~/.gvimrc;
fi

# Check for Ag.
echo -n "Checking for Ag: "
if ! command -v ag; then
  echo "Ag not exist."
  brew install the_silver_searcher
fi

# Check for .gemrc.
echo -n "Checking for .gemrc: "
if [ -e ~/.gemrc ]; then
  echo "~/.gemrc"
  echo -n ".gemrc existed. Do you want to delete this file? (y/n) "
  read yn
  case $yn in
    [Yy]* ) ln -f ~/dotfiles/.gemrc ~/.gemrc ;;
    *     ) exit
  esac
else
  echo "No .gemrc exist."
  ln ~/dotfiles/.gemrc ~/.gemrc;
fi

# Every things is done.
echo "done"
