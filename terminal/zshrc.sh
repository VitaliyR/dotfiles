#!/usr/bin/env zsh

curr="$HOME/.dotfiles"

# Load main files.
source "$curr/terminal/aliases.sh"
source "$curr/terminal/highlight.sh"
source "$curr/terminal/completion.sh"

autoload -U colors && colors

# Load and execute the prompt theming system.
fpath=("$curr/terminal" $fpath)
autoload -Uz promptinit && promptinit
prompt 'vitalii'

# ignore ctrl-d
setopt ignore_eof

path=(/usr/local/opt/ruby/bin $path) # changing .zshenv doesn't work
export GPG_TTY=$(tty) # For git commit signing

export PATH="/opt/homebrew/bin:$curr/terminal/bin:/opt/homebrew/opt/ruby/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$curr/terminal/vim.sh"

# pnpm
export PNPM_HOME="/Users/salen/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
