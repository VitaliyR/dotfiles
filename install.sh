#!/bin/bash

cd ~/.dotfiles

# Bash
echo '. ~/.dotfiles/terminal/init.sh' >> ~/.profile
. ~/.dotfiles/terminal/init.sh

# Scripts
ln -s ~/.dotfiles/terminal/imgcat.sh /usr/local/bin/imgcat

# Git
ln -s git/.gitconfig ~
ln -s git/.gitignore_global ~

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/dupes
brew tap caskroom/cask
brew tap caskroom/versions
bi brew-cask
bci $(<cask.txt)
bi $(<brew.txt)
bup

open ~/.dotfiles/terminal/Tomorrow\ Night\ Bright.itermcolors
open ~/.dotfiles/terminal/Solarized\ Dark.itermcolors
open ~/.dotfiles/terminal/Personal.itermcolors

# NPM
npm install -g $(<npm.txt)

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

# Sublime
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
ln -s ~/.dotfiles/sublime/Preferences.sublime-settings
ln -s ~/.dotfiles/sublime/Package\ Control.sublime-settings
ln -s ~/.dotfiles/sublime/Default\ \(OSX\).sublime-keymap
cd ~/.dotfiles

# OS X
. etc/osx.sh

echo 'Change sublime icon'
echo 'Import IntelliJ settings'
echo 'Install following applications from the AppStore:'
cat appstore.txt
