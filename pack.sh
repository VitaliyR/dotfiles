#!/bin/bash

# Pack everything is needed before sharing/comitting

brew list > brew.txt

# Sublime

cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ./sublime
cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings ./sublime
cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ (OSX).sublime-keymap ./sublime

echo 'Do not forget to setup your Sublime icon'
