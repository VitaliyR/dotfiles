#!/bin/bash

# Pack everything is needed before sharing/comitting

brew list > brew.txt
cp ../.gitconfig ./
cp ../.gitignore_global ./
cp ../.nanorc ./
cp ../.profile ./

cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ./
cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings ./
cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ (OSX).sublime-keymap ./

echo 'Do not forget to setup your Sublime icon'
