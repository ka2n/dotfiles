#!/bin/env bash

set -euCo pipefail

function main() {
    if [ -z $@ ]
    then
        :
    else
        nodenv exec rtm add "$@" 2>&1 && notify-send "RTM: Task added" || notify-send "RTM: fail to add task"
    fi
}

main $@
