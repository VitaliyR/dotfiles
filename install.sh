#!/usr/bin/env zsh

cd $HOME/.dotfiles

echo 'Installing on the server or local machine?'
echo '(c)lient [default]'
echo '(s)erver'

read installationType

isClient=true

case $installationType in
    "s"|"server")
        isClient=false
        ;;
    ""|"c"|"client")
	isClient=true
	;;
    *)
        echo 'Nothing selected. Exiting'
        exit 1
        ;;
esac

echo "Installing for $(if $isClient; then echo 'client'; else echo 'server'; fi)"

# zsh
ln -s "$HOME/.dotfiles/terminal/zshrc.sh" "$HOME/.zshrc"
source './terminal/zshrc.sh'

# Git
ln -s $(pwd)/git/.gitconfig ~/.gitconfig
ln -s $(pwd)/git/.gitignore_global ~/.gitignore_global

echo "Have you installed Xcode already? Install it firstly"
read -n 1 </dev/tty

if $isClient;
    then
        # Homebrew
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

        brew install $(<cask.txt) --cask
        brew install $(<brew.txt)
        brew update

        open ~/.dotfiles/terminal/Personal.itermcolors
fi

# Nano
mkdir -p $HOME/.nano
ln -s $HOME/.dotfiles/nano/.nanorc $HOME/

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# MC
if [[ "$OSTYPE" == darwin* ]] && $isClient; then
    echo 'Install applications from the AppStore. Press any key to continue\n'
    while read line; do
        appName=$(cut -d'|' -f1 <<<"$line")
        appLink=$(cut -d'|' -f2 <<<"$line")
        echo $appName
        open $appLink
        read -n 1 </dev/tty
    done < appstore.txt

    echo 'Install manually:'
    cat manual.txt

    echo 'Theme for Xcode'
	open etc/Darcula.dvtcolortheme
fi

echo 'Profit'
