# Install vim packages.
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim exuberant-ctags silversearcher-ag
sudo pip3 install neovim

# Create directory for vim backup and swap files.
mkdir -p ~/.vim/{backup_files,swap_files,undo_files}
mkdir -p ~/.config/nvim

# vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Check for .vimrc.
echo -n "Checking for .vimrc: "
if [ -e ~/.config/nvim/init.vim ]; then
  echo "~/.vimrc"
  echo -n ".vimrc existed. Do you want to delete this file? (y/n) "; read yn
  case $yn in
    [Yy]* ) cp .vimrc ~/.config/nvim/init.vim ;;
  esac
else
  echo "No .vimrc exist."
  cp .vimrc ~/.config/nvim/init.vim
fi

# Install all vim plugins.
nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall
