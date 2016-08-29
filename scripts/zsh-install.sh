# Install zsh.

if [ `uname` = 'Linux' ]; then
  sudo apt-get update
  sudo apt-get install zsh -y
fi

# Install Oh-My-Zsh.
echo -n "Checking for Oh-My-Zsh: "
if [ -e ~/.oh-my-zsh/oh-my-zsh.sh ]; then
  echo "~/.oh-my-zsh"
else
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# Install Zsh-Syntax-Hightlighting.
echo -n "Checking for zsh-syntax-hightlighting: "
if [ -e ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
  echo "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
else
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# Check .zshrc file.
echo -n "Checking for .zshrc: "
if [ -e ~/.zshrc ]; then
  echo "~/.zshrc"
  echo -n ".zshrc existed. Do you want to delete this file? (y/n) "; read yn
  case $yn in
    [Yy]* ) cp .zshrc ~/.zshrc ;;
  esac
else
  echo "No .zshrc file."
  cp .zshrc ~/.zshrc
fi

echo "Set zsh default, need your passwd."
chsh -s $(which zsh)
