#!/usr/bin/env zsh

LANG=en_US.UTF-8

#
# Initializes Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':prezto:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':prezto:*:*' color 'yes'

#
# Sets directory options and defines directory aliases.
#
# Authors:
#   James Cox <james@imaj.es>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Options
#

setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>.
                            # Use >! and >>! to bypass.

#
# Sets general shell options and defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Smart URLs
#

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

#
# General
#

setopt BRACE_CCL          # Allow brace character class list expansion.
setopt COMBINING_CHARS    # Combine zero-length punctuation characters (accents)
                          # with the base character.
setopt RC_QUOTES          # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.
unsetopt MAIL_WARNING     # Don't print a warning message if a mail file has been accessed.

#
# Jobs
#

setopt LONG_LIST_JOBS     # List jobs in the long format by default.
setopt AUTO_RESUME        # Attempt to resume existing job before creating a new process.
setopt NOTIFY             # Report status of background jobs immediately.
unsetopt BG_NICE          # Don't run all background jobs at a lower priority.
unsetopt HUP              # Don't kill jobs on shell exit.
unsetopt CHECK_JOBS       # Don't report on jobs when shell exit.

#
# Grep
#

if zstyle -t ':prezto:environment:grep' color; then
  export GREP_COLOR='37;45'
  export GREP_OPTIONS='--color=auto'
fi

#
# Termcap
#

if zstyle -t ':prezto:environment:termcap' color; then
  export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
  export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
  export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
  export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
  export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
  export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
  export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.
fi


#
# Sets history options and defines history aliases.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Variables
#

HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"       # The path to the history file.
HISTSIZE=10000                   # The maximum number of events to save in the internal history.
SAVEHIST=10000                   # The maximum number of events to save in the history file.


#
# Options
#

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.


#
# Provides for easier use of 256 colors and effects.
#
# Authors:
#   P.C. Shyamshankar <sykora@lucentbeing.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
# if [[ "$TERM" == 'dumb' ]]; then
#   return 1
# fi

typeset -gA FX FG BG

FX=(
                                        none                         "\e[00m"
                                        normal                       "\e[22m"
  bold                      "\e[01m"    no-bold                      "\e[22m"
  faint                     "\e[02m"    no-faint                     "\e[22m"
  standout                  "\e[03m"    no-standout                  "\e[23m"
  underline                 "\e[04m"    no-underline                 "\e[24m"
  blink                     "\e[05m"    no-blink                     "\e[25m"
  fast-blink                "\e[06m"    no-fast-blink                "\e[25m"
  reverse                   "\e[07m"    no-reverse                   "\e[27m"
  conceal                   "\e[08m"    no-conceal                   "\e[28m"
  strikethrough             "\e[09m"    no-strikethrough             "\e[29m"
  gothic                    "\e[20m"    no-gothic                    "\e[22m"
  double-underline          "\e[21m"    no-double-underline          "\e[22m"
  proportional              "\e[26m"    no-proportional              "\e[50m"
  overline                  "\e[53m"    no-overline                  "\e[55m"

                                        no-border                    "\e[54m"
  border-rectangle          "\e[51m"    no-border-rectangle          "\e[54m"
  border-circle             "\e[52m"    no-border-circle             "\e[54m"

                                        no-ideogram-marking          "\e[65m"
  underline-or-right        "\e[60m"    no-underline-or-right        "\e[65m"
  double-underline-or-right "\e[61m"    no-double-underline-or-right "\e[65m"
  overline-or-left          "\e[62m"    no-overline-or-left          "\e[65m"
  double-overline-or-left   "\e[63m"    no-double-overline-or-left   "\e[65m"
  stress                    "\e[64m"    no-stress                    "\e[65m"

                                        font-default                 "\e[10m"
  font-first                "\e[11m"    no-font-first                "\e[10m"
  font-second               "\e[12m"    no-font-second               "\e[10m"
  font-third                "\e[13m"    no-font-third                "\e[10m"
  font-fourth               "\e[14m"    no-font-fourth               "\e[10m"
  font-fifth                "\e[15m"    no-font-fifth                "\e[10m"
  font-sixth                "\e[16m"    no-font-sixth                "\e[10m"
  font-seventh              "\e[17m"    no-font-seventh              "\e[10m"
  font-eigth                "\e[18m"    no-font-eigth                "\e[10m"
  font-ninth                "\e[19m"    no-font-ninth                "\e[10m"
)

FG[none]="$FX[none]"
BG[none]="$FX[none]"
colors=(black red green yellow blue magenta cyan white)
for color in {0..255}; do
  if (( $color >= 0 )) && (( $color < $#colors )); then
    index=$(( $color + 1 ))
    FG[$colors[$index]]="\e[38;5;${color}m"
    BG[$colors[$index]]="\e[48;5;${color}m"
  fi

  FG[$color]="\e[38;5;${color}m"
  BG[$color]="\e[48;5;${color}m"
done
unset color{s,} index

setopt CORRECT

# System
alias cpu='ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10'
alias mtr='/usr/local/Cellar/mtr/0.86/sbin/mtr'

alias tmux='tmux -u'

# Start web server
alias serve='python3 $curr/scripts/server.py'
alias server='serve'

# Disable globbing.
alias bower='noglob bower'
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'
alias history='noglob history'
alias locate='noglob locate'
alias rake='noglob rake'
alias rsync='noglob rsync'
alias scp='noglob scp'
alias sftp='noglob sftp'
alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias k='kubectl'

# LS with color output and numberized chmod
function ll {
 ls -lahG --color=always $1 | awk '{
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
    print 'What manual page do you want?' >&2
  fi
}

function renameAlias {
  local old_alias=$(alias $1)
  local new_alias="${old_alias/$1/$2}"
  unalias $1
  eval $new_alias
}

# Find occurrences in current directory recursive
function findword {
  grep -rn ./ -e $1 --exclude-dir='(\.git)|(node_modules)'
}

# Find occurenses in files
function findwordin {
 find ./ -name $1 | xargs grep $2
}

function is-callable {
  (( $+commands[$1] )) || (( $+functions[$1] )) || (( $+aliases[$1] ))
}

# Count of files
function fcount {
  if [ -z "$1" ]
  then
    find . | wc -l
  else
    find $1 | wc -l
  fi
}

# Git

# Removes all branches except $1
function rmB {
  git branch | grep -v $1 | xargs git branch -D
}

function gu {
  git reset --soft HEAD
}

# Removes files by received glob
function rmfiles {
  find . -name $1 -print0 | xargs -0 rm
}

alias gr='git reset --hard'
function gc {
    git checkout -b $1 --track origin/$1
}
alias ga='git add .'
alias gs='git status'
alias gd='git diff'
alias gl='git log'

alias ll='eza -lha --group-directories-first --icons'
alias lll='eza -a --tree --level=2 --long --icons --git'

# Extract any archive with single command
# TODO - add extraction directories
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip $1 -d ${1%.zip} ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

alias cat='bat'
