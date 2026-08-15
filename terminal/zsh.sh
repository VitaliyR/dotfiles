# Zsh-specific configuration, loaded by aliases.sh.

export LANG=en_US.UTF-8

zstyle ':prezto:*:*' case-sensitive 'no'
zstyle ':prezto:*:*' color 'yes'

setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT PUSHD_TO_HOME
setopt CDABLE_VARS AUTO_NAME_DIRS MULTIOS EXTENDED_GLOB
unsetopt CLOBBER

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

setopt BRACE_CCL COMBINING_CHARS RC_QUOTES
unsetopt MAIL_WARNING
setopt LONG_LIST_JOBS AUTO_RESUME NOTIFY
unsetopt BG_NICE HUP CHECK_JOBS

if zstyle -t ':prezto:environment:grep' color; then
  export GREP_COLOR='37;45'
  export GREP_OPTIONS='--color=auto'
fi

if zstyle -t ':prezto:environment:termcap' color; then
  export LESS_TERMCAP_mb=$'\E[01;31m'
  export LESS_TERMCAP_md=$'\E[01;31m'
  export LESS_TERMCAP_me=$'\E[0m'
  export LESS_TERMCAP_se=$'\E[0m'
  export LESS_TERMCAP_so=$'\E[00;47;30m'
  export LESS_TERMCAP_ue=$'\E[0m'
  export LESS_TERMCAP_us=$'\E[01;32m'
fi

HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"
HISTSIZE=10000
SAVEHIST=10000
setopt BANG_HIST EXTENDED_HISTORY INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS HIST_VERIFY HIST_BEEP
setopt COMPLETEALIASES CORRECT

typeset -gA FX FG BG
FX=(
  none "\e[00m" normal "\e[22m"
  bold "\e[01m" no-bold "\e[22m"
  faint "\e[02m" no-faint "\e[22m"
  standout "\e[03m" no-standout "\e[23m"
  underline "\e[04m" no-underline "\e[24m"
  blink "\e[05m" no-blink "\e[25m"
  fast-blink "\e[06m" no-fast-blink "\e[25m"
  reverse "\e[07m" no-reverse "\e[27m"
  conceal "\e[08m" no-conceal "\e[28m"
  strikethrough "\e[09m" no-strikethrough "\e[29m"
  gothic "\e[20m" no-gothic "\e[22m"
  double-underline "\e[21m" no-double-underline "\e[22m"
  proportional "\e[26m" no-proportional "\e[50m"
  overline "\e[53m" no-overline "\e[55m"
  no-border "\e[54m"
  border-rectangle "\e[51m" no-border-rectangle "\e[54m"
  border-circle "\e[52m" no-border-circle "\e[54m"
  no-ideogram-marking "\e[65m"
  underline-or-right "\e[60m" no-underline-or-right "\e[65m"
  double-underline-or-right "\e[61m" no-double-underline-or-right "\e[65m"
  overline-or-left "\e[62m" no-overline-or-left "\e[65m"
  double-overline-or-left "\e[63m" no-double-overline-or-left "\e[65m"
  stress "\e[64m" no-stress "\e[65m"
  font-default "\e[10m"
  font-first "\e[11m" no-font-first "\e[10m"
  font-second "\e[12m" no-font-second "\e[10m"
  font-third "\e[13m" no-font-third "\e[10m"
  font-fourth "\e[14m" no-font-fourth "\e[10m"
  font-fifth "\e[15m" no-font-fifth "\e[10m"
  font-sixth "\e[16m" no-font-sixth "\e[10m"
  font-seventh "\e[17m" no-font-seventh "\e[10m"
  font-eigth "\e[18m" no-font-eigth "\e[10m"
  font-ninth "\e[19m" no-font-ninth "\e[10m"
)
FG[none]="$FX[none]"
BG[none]="$FX[none]"
colors=(black red green yellow blue magenta cyan white)
for color in {0..255}; do
  if (( color < $#colors )); then
    index=$(( color + 1 ))
    FG[$colors[$index]]="\e[38;5;${color}m"
    BG[$colors[$index]]="\e[48;5;${color}m"
  fi
  FG[$color]="\e[38;5;${color}m"
  BG[$color]="\e[48;5;${color}m"
done
unset color{s,} index

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

function is-callable {
  (( $+commands[$1] )) || (( $+functions[$1] )) || (( $+aliases[$1] ))
}
