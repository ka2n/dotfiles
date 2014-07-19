# peco settings

function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^S' peco-src

# http://d.hatena.ne.jp/sugyan/20140611/1402487717
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER             # move cursor
    zle -R -c                   # refresh
}
zle -N peco-select-history
bindkey '^R' peco-select-history

function ssh_list_host() { grep '^Host\s' ~/.ssh/config | awk '{for(i=2;i<=NF;i++) print $i;}' }
alias s='ssh $(ssh_list_host | peco)'
