#!/bin/sh

device="AT Translated Set 2 keyboard"

current=$(xinput list-props "$device" | grep "Device Enabled" | awk '{print $4}')
if [ "$current" -eq 1 ]; then
    xinput --disable "$device"
    notify-send "Keyboard disabled"
else
    xinput --enable "$device"
    notify-send "Keyboard enabled"
fi
