#!/usr/bin/env zsh

cd $HOME/.dotfiles

. ./variables.sh

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

# tmux
ln -s "$HOME/.dotfiles/terminal/tmux.conf" "$HOME/.tmux.conf"

# zellij
ln -s "$HOME/.dotfiles/terminal/zellij" "$HOME/.config/zellij"

# alacritty
ln -s "$HOME/.dotfiles/terminal/alacritty/alacritty.toml" "$HOME/.alacritty.toml"

# ghostty 
ln -s "$HOME/.dotfiles/terminal/ghostty" "$HOME/.config/ghostty"

# zsh
ln -s "$HOME/.dotfiles/terminal/zshrc.sh" "$HOME/.zshrc"
source './terminal/zshrc.sh'

touch $HOME/.zshenv
echo "source $HOME/.dotfiles/terminal/aliases.sh" >> .zshenv

# Git
ln -s $(pwd)/git/.gitconfig ~/.gitconfig
ln -s $(pwd)/git/.gitignore_global ~/.gitignore_global

# karabiner
mkdir -p ~/.config
ln -s $(pwd)/settings/karabiner ~/.config/

# neovim
ln -s $(pwd)/nvim ~/.config/

# zed
mkdir -p ~/.config/zed
ln -s $(pwd)/zed/keymap.json ~/.config/zed/keymap.json
ln -s $(pwd)/zed/settings.json ~/.config/zed/settings.json

echo "Have you installed Xcode already? Install it firstly"
read -n 1 </dev/tty

if $isClient;
    then
        # Homebrew
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

        brew tap homebrew/cask-fonts

        brew install $(<brew.txt)
        brew update

        open ~/.dotfiles/terminal/Personal.itermcolors
fi

# Nano
mkdir -p $HOME/.nano
ln -s $HOME/.dotfiles/nano/.nanorc $HOME/.nanorc

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

if [[ "$OSTYPE" == darwin* ]] && $isClient; then
    echo 'Install manual applications. Press any key to continue\n'
    while read line; do
        appName=$(cut -d'|' -f1 <<<"$line")
        appLink=$(cut -d'|' -f2 <<<"$line")
        echo $appName
        open $appLink
        read -n 1 </dev/tty
    done < manual.txt

    echo 'Theme for Xcode'
	open etc/Darcula.dvtcolortheme
fi

# Velja
cp ./settings/$VELJA_PLIST_NAME $VELJA_PLIST

echo 'Profit'
