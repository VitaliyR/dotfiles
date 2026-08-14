#!/usr/bin/env zsh

echo 'Homebrew'
brew tap >! brew-taps.txt
brew leaves >! brew.txt
brew list --casks -1 >> brew.txt
