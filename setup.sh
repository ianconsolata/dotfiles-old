#! /bin/bash

for file in vim vimrc emacs.d emacs bash_profile bashrc gitconfig gitignore_global prompt.sh git-prompt.sh; do
  ln -sf ~/.dotfiles/$file ~/.$file;
done

# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install macvim --with-override-system-vim

git clone --depth=1 git@github.com:burke/matcher.git; cd matcher; make install; cd ..; rm -rf matcher

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
