#!/bin/bash

cd ~/.dotfiles

# Bash
echo '. ~/.dotfiles/terminal/init.sh' >> ~/.profile

# Git
ln -s git/.gitconfig ~
ln -s git/.gitignore_global ~

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/dupes
bi $(<brew.txt)
bup

open ~/.dotfiles/terminal/TomorrowNight.itermcolors

bci $(<cask.txt)

# NPM
npm install -g $(<npm.txt)

# Nano
ln -s nano/.nanorc ~
cd nano/nanorc
make install
cd ../../

# Sublime
cp sublime/Preferences.sublime-settings  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
cp sublime/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
cp sublime/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap

echo 'Change sublime icon'
echo 'Import IntelliJ settings'
echo 'Install following applications from the AppStore:'
cat appstore.txt
