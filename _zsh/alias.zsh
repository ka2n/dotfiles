# Alias

function lessmd() {
  grip --gfm --export $1 /dev/stdout | w3m -T text/html
}

function edinetall() {
    ufocatch list --source=edinetx $@ | grep -e '有価証券報告書' -e '有価証券届出書' -e '四半期報告書' | ufocatch get
}
function tdnetall() {
    ufocatch list --source=tdnetx $@ | grep -e '短信' | ufocatch get
}
function tdnetpdfall() {
    ufocatch list --source=tdnetx $@ | grep -e '短信' | ufocatch get --format pdf
}
function edinetpdfall() {
    ufocatch list --source=edinetx $@ | grep -e '有価証券報告書' -e '有価証券届出書' -e '四半期報告書' | ufocatch get --format pdf
}

function edinet() {
    ufocatch list --source=edinetx $@ | peco | ufocatch get
}
function edinetpdf() {
    ufocatch list --source=edinetx $@ | peco | ufocatch get -format pdf
}
function tdnet() {
    ufocatch list --source=tdnetx $@ | peco | ufocatch get
}
function tdnetpdf() {
    ufocatch list --source=tdnetx $@ | peco | ufocatch get -format pdf
}


#alias vim=nvim
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias note='tee >(terminal-notifier -message "🍺")'
alias gdoc='godoc $(ghq list | peco) less'

