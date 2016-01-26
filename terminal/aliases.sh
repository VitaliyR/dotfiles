# bash completion, install via brew bash-completion
if [[ "$OSTYPE" == darwin* ]] && [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

LANG=en_US.UTF-8

# CD to Homedir. Yes, too lazy to move fingers to ~
alias cdh='cd ~'

# Clearing the output
alias cl='clear'

# Lock the system with screensaver
alias lock='open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'

# Bower & NPM
alias nii='npm install'
alias niis='npm install --save'
alias niisd='npm install --save-dev'
alias ns='npm search'
alias bii='bower install'
alias biis='bower install --save'
alias bs='bower search'
alias bi='bower info'
alias nbc='rm -rf {bower_components,node_modules} && npm install && bower install'

alias ngre='sudo nginx -s stop && sudo nginx'

# Removes unnecessary files like ._ or .DS_Store.
# Using for clearing flash drive for my car
function ru {
 find . -name '._*' -exec rm -v {} \;
 find . -name '.DS_Store' -exec rm -v {} \;
}

# LS with color output and numberized chmod
function la {
 ls -lahG $1 | awk '{
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

# Open PhpStorm
function phpstorm {
  open -a "PhpStorm" $@
}

# Find occurrences in current directory recursive
function findword {
  grep -rn ./ -e $1 --exclude-dir=\.git
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
  git reset --soft HEAD~
}

# Removes files by received glob
function rmfiles {
  find . -name $1 -print0 | xargs -0 rm
}

alias gr='git reset --hard'
alias gc='git checkout'
alias ga='git add .'
alias gs='git status'
alias gd='git diff'
alias gl='git log'

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

function exuadownload {
 wget $1 -e use_proxy=yes -e http_proxy=77.47.137.232:3128
}

# Code Highlight
alias hjs="pbpaste | highlight --syntax=js -O rtf --font-size 24 --font Inconsolata --style solarized-dark | pbcopy"
alias hhtml="pbpaste | highlight --syntax=js -O rtf --font-size 24 --font Inconsolata --style solarized-dark | pbcopy"
alias hcss="pbpaste | highlight --syntax=js -O rtf --font-size 24 --font Inconsolata --style solarized-dark | pbcopy"

# Alias for maven install for IDEA w/o Maven plugin
alias sap="mvn clean install -PinstallPackage -Dmaven.test.skip=true"

# Open GC or Opera with support CORS for file
alias ggc='open -a Google\ Chrome --args --disable-web-security'
alias opera='open -a Opera --args --disable-web-security'

# Open Editors
alias sublime='open -a Sublime\ Text'

if [[ "$OSTYPE" == darwin* ]]; then
 export JAVA_HOME=$(/usr/libexec/java_home)
 export MAVEN_OPTS="-Xms256m -Xmx512m -XX:PermSize=64m -XX:MaxPermSize=256m -Djava.awt.headless=true"
fi

# Homebrew
alias brup='brew update && brew upgrade --all'
alias brout='brew outdated'
alias bri='brew install'
alias brl='brew list'
alias brs='brew search'
alias brci='brew cask install'
alias brcl='brew cask list'
alias brcs='brew cask search'

alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
