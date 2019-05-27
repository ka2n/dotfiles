#!/bin/sh
# $1: finding process name
# $2: executable name
# $3: WM_CLASS
# $4: WM_CLASS instance

count=`ps -aux | grep -v "$0" | grep -v "grep" | grep -c "$1"`
if [ $count -eq 0 ]; then
    i3-msg "exec $2"
else
    if [ -z "$4" ]; then
        i3-msg "[class=\"$3\"] focus"
    else
        i3-msg "[class=\"$3\" instance=\"$4\"] focus"
    fi
fi
