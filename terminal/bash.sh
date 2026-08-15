# Bash-specific configuration, loaded by aliases.sh.

export LANG=en_US.UTF-8

shopt -s autocd cdspell checkjobs cmdhist histappend extglob
HISTFILE="${HISTFILE:-$HOME/.bash_history}"
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth:erasedups

declare -gA FX FG BG
FX=(
  [none]=$'\e[00m' [normal]=$'\e[22m'
  [bold]=$'\e[01m' [no-bold]=$'\e[22m'
  [faint]=$'\e[02m' [no-faint]=$'\e[22m'
  [standout]=$'\e[03m' [no-standout]=$'\e[23m'
  [underline]=$'\e[04m' [no-underline]=$'\e[24m'
  [blink]=$'\e[05m' [no-blink]=$'\e[25m'
  [fast-blink]=$'\e[06m' [no-fast-blink]=$'\e[25m'
  [reverse]=$'\e[07m' [no-reverse]=$'\e[27m'
  [conceal]=$'\e[08m' [no-conceal]=$'\e[28m'
  [strikethrough]=$'\e[09m' [no-strikethrough]=$'\e[29m'
  [double-underline]=$'\e[21m' [no-double-underline]=$'\e[22m'
  [overline]=$'\e[53m' [no-overline]=$'\e[55m'
)
FG[none]="${FX[none]}"
BG[none]="${FX[none]}"
colors=(black red green yellow blue magenta cyan white)
for color in {0..255}; do
  if (( color < ${#colors[@]} )); then
    FG["${colors[color]}"]=$'\e'"[38;5;${color}m"
    BG["${colors[color]}"]=$'\e'"[48;5;${color}m"
  fi
  FG["$color"]=$'\e'"[38;5;${color}m"
  BG["$color"]=$'\e'"[48;5;${color}m"
done
unset colors color

function e {
  "${VISUAL:-${EDITOR:-vi}}" "$@"
}

function is-callable {
  command -v "$1" >/dev/null 2>&1
}
