#!/bin/sh
# $1: WM_CLASS
# $2: WM_CLASS instance
# $3: executable name

count=`xprop -root _NET_CLIENT_LIST | grep -o '0x[^,]*' | xargs -I{} xprop -id {} WM_CLASS | grep "$1" | grep "$2" | wc -l`
if [ $count -eq 0 ]; then
    i3-msg "exec $3"
else
    if [ -z "$4" ]; then
        i3-msg "[class=\"$1\"] focus"
    else
        i3-msg "[class=\"$1\" instance=\"$2\"] focus"
    fi
fi
