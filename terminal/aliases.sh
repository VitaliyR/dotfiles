# bash completion, install via brew bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
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
alias ni='npm install'
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias bi='bower install'
alias bis='bower install --save'
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

# Code Highlight
alias hjs="pbpaste | highlight --syntax=js -O rtf --font-size 24 --font Inconsolata --style solarized-dark | pbcopy"
alias hhtml="pbpaste | highlight --syntax=js -O rtf --font-size 24 --font Inconsolata --style solarized-dark | pbcopy"
alias hcss="pbpaste | highlight --syntax=js -O rtf --font-size 24 --font Inconsolata --style solarized-dark | pbcopy"

# Alias for maven install for IDEA w/o Maven plugin
alias sap="mvn clean install -PinstallPackage -Dmaven.test.skip=true"

# Open Google Chrome with support CORS for file
alias gc='open -a Google\ Chrome --args --disable-web-security'

# Java crap
export JAVA_HOME=$(/usr/libexec/java_home)
export MAVEN_OPTS="-Xms256m -Xmx512m -XX:PermSize=64m -XX:MaxPermSize=256m -Djava.awt.headless=true"

# Homebrew
alias bup='brew update && brew upgrade --all'
alias bout='brew outdated'
alias bi='brew install'
alias bl='brew list'
