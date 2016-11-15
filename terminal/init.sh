#!/usr/bin/env bash

DOTFILES_BASEDIR=$(pwd)

if [ ! -d ".dotfiles" ]; then
	DOTFILES_BASEDIR=~
fi

. $DOTFILES_BASEDIR/.dotfiles/terminal/highlight.sh
. $DOTFILES_BASEDIR/.dotfiles/terminal/aliases.sh
. $DOTFILES_BASEDIR/.dotfiles/terminal/extras.sh
. $DOTFILES_BASEDIR/.dotfiles/terminal/help.sh
. $DOTFILES_BASEDIR/.dotfiles/git/git-completion.sh

export EDITOR=nano
export PATH=$PATH:$HOME/.nodebrew/current/bin:./node_modules/.bin:$HOME/.ruby/bin
