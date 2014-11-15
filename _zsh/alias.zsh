# Alias

alias vim=nvim

function lessmd() {
  grip --gfm --export $1 /dev/stdout | w3m -T text/html
}
