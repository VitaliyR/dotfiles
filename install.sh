#!/bin/bash

# Bash
echo 'source .dotfiles/terminal/init.sh' >> ~/.profile

# Git
ln -s git/.gitconfig ~
ln -s git/.gitignore_global ~

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/dupes
bi $(<brew.txt)
bup
