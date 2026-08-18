#!/usr/bin/env sh

# Load settings for the shell that is sourcing this file.
if [ -n "${ZSH_VERSION:-}" ]; then
  source "${DOTFILES_DIR:-$HOME/.dotfiles}/terminal/zsh.sh"
elif [ -n "${BASH_VERSION:-}" ]; then
  source "${DOTFILES_DIR:-$HOME/.dotfiles}/terminal/bash.sh"
else
  echo "aliases.sh: unsupported shell" >&2
  return 1 2>/dev/null || exit 1
fi

# System
alias cpu='ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10'
alias mtr='/usr/local/Cellar/mtr/0.86/sbin/mtr'
alias tmux='tmux -u'

# Start web server
alias serve='python3 ${DOTFILES_DIR:-$HOME/.dotfiles}/scripts/server.py'
alias server='serve'
alias k='kubectl'

alias claude-netlify='CLAUDE_CONFIG_DIR="$HOME/.claude-netlify" claude'

# LS with color output and numberized chmod
function ll {
  ls -lahG --color=always "$1" | awk '{
    k=0;
    for (i=0; i<=8; i++)
      k+= (( substr($1,i+2,1)~/[rwx]/ )*2^( 8-i ));
    if (k)
      printf("%0o ", k);
    print;
  }'
}

# Open Preview.app with man of app
function manp {
  local page
  if (( $# > 0 )); then
    for page in "$@"; do
      man -t "$page" | open -f -a Preview
    done
  else
    echo 'What manual page do you want?' >&2
  fi
}

function renameAlias {
  local old_alias
  local new_alias
  old_alias=$(alias "$1")
  new_alias="${old_alias/$1/$2}"
  unalias "$1"
  eval "$new_alias"
}

function findword {
  grep -rn ./ -e "$1" --exclude-dir='(\.git)|(node_modules)'
}

function findwordin {
  find ./ -name "$1" | xargs grep "$2"
}

function fcount {
  if [ -z "$1" ]; then
    find . | wc -l
  else
    find "$1" | wc -l
  fi
}

# Git
function rmB {
  git branch | grep -v "$1" | xargs git branch -D
}

function gu {
  git reset --soft HEAD
}

alias gbu='git branch --set-upstream-to=origin/$(git branch --show-current)'

function rmfiles {
  find . -name "$1" -print0 | xargs -0 rm
}

alias gr='git reset --hard'
function gc {
  git checkout -b "$1" --track "origin/$1"
}
alias ga='git add .'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gclean='git branch | grep -v "^\*" | grep -v "main" | xargs git branch -D'
alias difit='npx difit @ main --keep-alive --merge-base'

alias ll='eza -lha --group-directories-first --icons'
alias lll='eza -a --tree --level=2 --long --icons --git'

function extract {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  elif [ -f "$1" ]; then
    case $1 in
      *.tar.bz2) tar xvjf "../$1" ;;
      *.tar.gz)  tar xvzf "../$1" ;;
      *.tar.xz)  tar xvJf "../$1" ;;
      *.lzma)    unlzma "../$1" ;;
      *.bz2)     bunzip2 "../$1" ;;
      *.rar)     unrar x -ad "../$1" ;;
      *.gz)      gunzip "../$1" ;;
      *.tar)     tar xvf "../$1" ;;
      *.tbz2)    tar xvjf "../$1" ;;
      *.tgz)     tar xvzf "../$1" ;;
      *.zip)     unzip "$1" -d "${1%.zip}" ;;
      *.Z)       uncompress "../$1" ;;
      *.7z)      7z x "../$1" ;;
      *.xz)      unxz "../$1" ;;
      *.exe)     cabextract "../$1" ;;
      *)         echo "extract: '$1' - unknown archive method" ;;
    esac
  else
    echo "$1 - file does not exist"
  fi
}

alias cat='bat'
