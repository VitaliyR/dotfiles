#!/bin/bash

cd ~/.dotfiles

# Bash
echo '. ~/.dotfiles/terminal/init.sh' >> ~/.profile
. ~/.dotfiles/terminal/init.sh

# Scripts
ln -s ~/.dotfiles/terminal/imgcat.sh /usr/local/bin/imgcat

# Git
ln -s $(pwd)/git/.gitconfig ~/.gitconfig
ln -s $(pwd)/git/.gitignore_global ~/.gitignore_global

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/dupes
brew tap caskroom/cask
brew tap caskroom/versions
bi brew-cask
bci $(<cask.txt)
bi $(<brew.txt)
bup

# Hyper
ln -s $(pwd)/hyper.js ../../.hyper.js

open ~/.dotfiles/terminal/Tomorrow\ Night\ Bright.itermcolors
open ~/.dotfiles/terminal/Solarized\ Dark.itermcolors
open ~/.dotfiles/terminal/Personal.itermcolors

# Nano
ln -s nano/.nanorc ~
cd nano/nanorc
make install
cd ../../

# MC
if [[ "$OSTYPE" == darwin* ]]; then
    ln -s ~/.profile .local/share/mc/bashrc
else
    ln -s ~/.bash_profile .local/share/mc/bashrc
fi

# OS X
. etc/osx.sh

echo 'Install applications from the AppStore. Press any key to continue\n'
while read line; do
    appName=$(cut -d'|' -f1 <<<"$line")
    appLink=$(cut -d'|' -f2 <<<"$line")
    echo $appName
    open $appLink
    read -n 1 -s -r </dev/tty
done < appstore.txt
echo 'Thats it'
