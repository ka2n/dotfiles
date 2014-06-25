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

function ssh_list_host() { grep '^Host\s' ~/.ssh/config | awk '{for(i=2;i<=NF;i++) print $i;}' }
alias s='ssh $(ssh_list_host | peco)'
