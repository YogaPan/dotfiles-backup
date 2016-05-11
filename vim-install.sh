# Install vim packages.

# Detect operating system
operating_system=`uname`

if [ $operating_system = "Darwin" ]; then
  echo "Install Mac os dependencies...\n"
  brew install vim
  brew install ctags
  brew install the_silver_searcher
fi

if [ $operating_system = "Linux" ]; then
  echo "Install Linux dependencies...\n"
  sudo apt-get update
  sudo apt-get install vim exuberant-ctags -y
  sudo apt-get install silversearcher-ag -y
  sudo apt-get install curl -y
fi

# Create directory for vim backup and swap files.
rm -rf ~/.vim
#mkdir -p ~/.vim/{backup_files,swap_files,undo_files}
mkdir ~/.vim/backup_files
mkdir ~/.vim/swap_files
mkdir ~/.vim/undo_files

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
vim +PlugInstall +qall
