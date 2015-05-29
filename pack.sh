#!/bin/bash

# Pack everything is needed before sharing/comitting

brew list > brew.txt

# Sublime

cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ~/.dotfiles/sublime
cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings ~/.dotfiles/sublime
cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap ~/.dotfiles/sublime
