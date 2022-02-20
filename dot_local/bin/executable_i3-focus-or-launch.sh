#!/bin/sh
# $1: finding process name
# $2: executable name
# $3: WM_CLASS
# $4: WM_CLASS instance
# NO_TOGGLE: disable toggle for scratchpad

count=`ps -aux | grep -v "$0" | grep -v "grep" | grep -c "$1"`
if [ $count -eq 0 ]; then
    i3-msg "exec $2"
    exit 0
fi

if [ -z "$4"]; then
    floatingID=`xdotool search --all --onlyvisible --class $3`
else
    floatingID=`xdotool search --all --onlyvisible --class $3 --classname $4`
fi

if [[ $floatingID ]]; then
    xprop -id $floatingID | grep -q "I3_FLOATING_WINDOW"
    no_floating=$?
else
    no_floating=1
fi


if [ -z "$4"]; then
    i3winmodifier="[class=\"$3\"]"
else
    i3winmodifier="[class=\"$3\" instance=\"$4\"]"
fi

if [ $no_floating -eq 1 ] || [ "$NO_TOGGLE" -eq "1" ]; then
    i3-msg "$i3winmodifier focus"
else
    i3-msg "$i3winmodifier scratchpad show"
fi
