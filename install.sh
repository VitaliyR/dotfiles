#!/bin/bash

cd ~/.dotfiles

# Bash
echo '. ~/.dotfiles/terminal/init.sh' >> ~/.profile
open ~/.dotfiles/terminal/TomorrowNight.itermcolors

# Git
ln -s git/.gitconfig ~
ln -s git/.gitignore_global ~

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/dupes
bi $(<brew.txt)
bup

# Nano
ln -s nano/.nanorc ~
cd nano
make install
cd ../

# Sublime
cp sublime/Preferences.sublime-settings  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
cp sublime/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
cp sublime/Default\ (OSX).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ (OSX).sublime-keymap
