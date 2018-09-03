# Coloring the output of grep, less, ls
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='01;34;04'
export CLICOLOR_FORCE=true
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LESS='-R'

export COLOR_NC='\x1B[0m' # No Color
export COLOR_WHITE='\x1B[1;37m'
export COLOR_BLACK='\x1B[0;30m'
export COLOR_BLUE='\x1B[0;34m'
export COLOR_LIGHT_BLUE='\x1B[1;34m'
export COLOR_GREEN='\x1B[0;32m'
export COLOR_LIGHT_GREEN='\x1B[1;32m'
export COLOR_CYAN='\x1B[0;36m'
export COLOR_LIGHT_CYAN='\x1B[1;36m'
export COLOR_RED='\x1B[0;31m'
export COLOR_LIGHT_RED='\x1B[1;31m'
export COLOR_PURPLE='\x1B[0;35m'
export COLOR_LIGHT_PURPLE='\x1B[1;35m'
export COLOR_BROWN='\x1B[0;33m'
export COLOR_YELLOW='\x1B[1;33m'
export COLOR_GRAY='\x1B[0;30m'
export COLOR_LIGHT_GRAY='\x1B[0;37m'

export COLOR_BOLD='\x1B[0;1m'
export COLOR_DIM='\x1B[0;2m'
export COLOR_UNDERLINE='\x1B[0;4m'
export COLOR_BLINK='\x1B[0;5m'
export COLOR_INVERT='\x1B[0;7m'
export COLOR_HIDDEN='\x1B[0;8m'

# @gf3’s Sexy Bash Prompt, inspired by “Extravagant Zsh Prompt”
# Shamelessly copied from https://github.com/gf3/dotfiles
# And not only by me. Actually I found it on the stackoverflow :)
# Screenshot: http://i.imgur.com/s0Blh.png

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 
2>&1; then
  if [ $TERM != cygwin ]; then
    export TERM=gnome-256color
  fi
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

if [ $TERM != cygwin ] && tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    # Changed these colors to fit Solarized theme
    MAGENTA=$(tput setaf 125)
    ORANGE=$(tput setaf 166)
    GREEN=$(tput setaf 64)
    PURPLE=$(tput setaf 61)
    WHITE=$(tput setaf 244)
  else
    MAGENTA=$(tput setaf 5)
    ORANGE=$(tput setaf 4)
    GREEN=$(tput setaf 2)
    PURPLE=$(tput setaf 1)
    WHITE=$(tput setaf 7)
  fi
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  MAGENTA="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  BOLD=""
  RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != *"working tree clean"* ]] && echo "*"
}

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on 
\")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"
