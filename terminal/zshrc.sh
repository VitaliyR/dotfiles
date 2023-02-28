# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

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

path=(/usr/local/opt/ruby/bin $path) # changing .zshenv doesn't work
export GPG_TTY=$(tty) # For git commit signing

export PATH="node_modules/.bin:/opt/homebrew/bin:$HOME/.dotfiles/terminal/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
