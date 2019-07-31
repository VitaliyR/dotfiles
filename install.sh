#!/bin/bash

cd ~/.dotfiles

echo 'Installing on the server or local machine?'
echo '(c)lient [default]'
echo '(s)erver'

read installationType

isClient=true

case $installationType in
    "s")
        isClient=false
        ;;
    "server")
        isClient=false
        ;;
    "")
	isClient=true
	;;
    *)
        echo 'Nothing selected. Exiting'
        exit 1
        ;;
esac

echo "Installing for $(if $isClient; then echo 'client'; else echo 'server'; fi)"

# Bash
echo '. ~/.dotfiles/terminal/init.sh' >> ~/.profile
. ~/.dotfiles/terminal/init.sh

# Scripts
ln -s ~/.dotfiles/terminal/imgcat.sh /usr/local/bin/imgcat

# Git
ln -s $(pwd)/git/.gitconfig ~/.gitconfig
ln -s $(pwd)/git/.gitignore_global ~/.gitignore_global

echo "Have you installed Xcode already? Install it firstly"
read -n 1 -s -r </dev/tty

if $isClient;
    then
        # Homebrew
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew tap caskroom/cask
        brew tap homebrew/cask-versions

	brew cask install java

	echo "Dont forget to add bash-completions to bash_profile"

        bi brew-cask
        bci $(<cask.txt)
        bi $(<brew.txt)
        bup;

        # Hyper
        ln -s $(pwd)/hyper.js ../../.hyper.js

        open ~/.dotfiles/terminal/Tomorrow\ Night\ Bright.itermcolors
        open ~/.dotfiles/terminal/Solarized\ Dark.itermcolors
        open ~/.dotfiles/terminal/Personal.itermcolors
fi

# Nano
ln -s nano/.nanorc ~
cd nano/nanorc
make install
cd ../../

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install 10

# MC
if [[ "$OSTYPE" == darwin* ]]; then
    ln -s ~/.profile .local/share/mc/bashrc
    
    # OS X Shortcuts
    . etc/osx.sh

    echo 'Install applications from the AppStore. Press any key to continue\n'
    while read line; do
        appName=$(cut -d'|' -f1 <<<"$line")
        appLink=$(cut -d'|' -f2 <<<"$line")
        echo $appName
        open $appLink
        read -n 1 -s -r </dev/tty
    done < appstore.txt

    echo 'Install manually:'
    cat manual.txt
else
    ln -s ~/.bash_profile .local/share/mc/bashrc
fi

if $isClient;
    then
        sudo gem install cocoapods
fi

echo 'Thats it'
