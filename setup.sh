#! /bin/bash


# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install macvim --with-override-system-vim

vim +PluginInstall +qall
