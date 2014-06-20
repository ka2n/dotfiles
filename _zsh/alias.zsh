# Alias

alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

function lessmd() {
  grip --gfm --export $1 /dev/stdout | w3m -T text/html
}
