#!/usr/bin/env zsh

. ./variables.sh

echo 'Velja'
cp $VELJA_PLIST ./settings/

echo 'Homebrew'
brew leaves > brew.txt
brew list --casks -1 >> brew.txt
