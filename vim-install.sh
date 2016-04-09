# Install vim packages.
sudo apt-get update
sudo apt-get install vim exuberant-ctags

# Create directory for vim backup and swap files.
mkdir -p ~/.vim/{backup_files,swap_files,undo_files}

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Check for .vimrc.
echo -n "Checking for .vimrc: "
if [ -e ~/.vimrc ]; then
  echo "~/.vimrc"
  echo -n ".vimrc existed. Do you want to delete this file? (y/n) "; read yn
  case $yn in
    [Yy]* ) cp .vimrc ~/.vimrc ;;
  esac
else
  echo "No .vimrc exist."
  cp .vimrc ~/.vimrc
fi

# Install all vim plugins.
nvim +PlugInstall +qall
