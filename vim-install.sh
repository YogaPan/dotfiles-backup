# Install vim packages.
sudo apt-get update
sudo apt-get install vim exuberant-ctags silversearcher-ag

# Create directory for vim backup and swap files.
mkdir -p ~/.vim/{backup_files,swap_files,undo_files}

# Use vundle as vim plugin manager.
echo -n "Checking for Vundle: "
if [ -e ~/.vim/bundle/Vundle.vim ]; then
  echo "~/.vim/bundle/Vundle.vim"
else
  echo "No vundle installed."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Check for .vimrc.
echo -n "Checking for .vimrc: "
if [ -e ~/.vimrc ]; then
  echo "~/.vimrc"
  echo -n ".vimrc existed. Do you want to delete this file? (y/n) "; read yn
  case $yn in
    [Yy]* ) ln -f ~/dotfiles/.vimrc ~/.vimrc ;;
  esac
else
  echo "No .vimrc exist."
  ln ~/dotfiles/.vimrc ~/.vimrc
fi

# Install all vim plugins.
vim +PluginInstall +qall
