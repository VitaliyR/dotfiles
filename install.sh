#!/usr/bin/env zsh

cd $HOME/.dotfiles

currentShell="$(basename "$SHELL")"
case "$currentShell" in
    zsh|bash)
        ;;
    *)
        echo "Unsupported shell: $SHELL"
        exit 1
        ;;
esac

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

# Detect OS
isMac=false
if [[ "$OSTYPE" == darwin* ]]; then
    isMac=true
fi

# tmux
ln -s "$HOME/.dotfiles/terminal/tmux.conf" "$HOME/.tmux.conf"

# zellij
ln -s "$HOME/.dotfiles/terminal/zellij" "$HOME/.config/zellij"

# Shell
case "$currentShell" in
    zsh)
        ln -s "$HOME/.dotfiles/terminal/zshrc.sh" "$HOME/.zshrc"
        source './terminal/zshrc.sh'

        touch "$HOME/.zshenv"
        echo "source $HOME/.dotfiles/terminal/aliases.sh" >> "$HOME/.zshenv"
        ;;
    bash)
        ln -s "$HOME/.dotfiles/terminal/aliases.sh" "$HOME/.bash_profile"
        ;;
esac

# neovim
ln -s $(pwd)/nvim ~/.config/

if $isMac && $isClient; then
    echo "Have you installed Xcode already? Install it firstly"
    echo "Make sure that App Store is logged in as well"
    read -n 1 </dev/tty
fi

if $isClient;
    then
        # Git
        ln -s $(pwd)/git/.gitconfig ~/.gitconfig
        ln -s $(pwd)/git/.gitignore_global ~/.gitignore_global

        if $isMac && [[ ! -e "$HOME/.gitconfig.creds" && ! -L "$HOME/.gitconfig.creds" ]]; then
            install -m 600 "$(pwd)/git/.gitconfig.creds.client.mac.tpl" "$HOME/.gitconfig.creds"
        fi

        # zed
        mkdir -p ~/.config/zed
        ln -s $(pwd)/zed/keymap.json ~/.config/zed/keymap.json
        ln -s $(pwd)/zed/settings.json ~/.config/zed/settings.json

        # ghostty
        ln -s "$HOME/.dotfiles/terminal/ghostty" "$HOME/.config/ghostty"
fi

# Nano
mkdir -p $HOME/.nano
ln -s $HOME/.dotfiles/nano/.nanorc $HOME/.nanorc

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

if $isMac && $isClient; then
    # defaults
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false
    defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'

    # Homebrew
    if ! command -v brew >/dev/null 2>&1; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        if [[ -x /opt/homebrew/bin/brew ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -x /usr/local/bin/brew ]]; then
            eval "$(/usr/local/bin/brew shellenv)"
        fi
    fi

    brew bundle --file="$HOME/.dotfiles/Brewfile"

    # Karabiner-Elements
    ln -s "$HOME/.dotfiles/terminal/karabiner" "$HOME/.config/karabiner"

    echo 'Theme for Xcode'
    open etc/Darcula.dvtcolortheme
fi

echo 'Profit'
