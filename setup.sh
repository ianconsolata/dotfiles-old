#! /bin/bash


# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install macvim --with-override-system-vim

git clone --depth=1 git@github.com:burke/matcher.git; cd matcher; make install; cd ..; rm -rf matcher

vim +PluginInstall +qall
