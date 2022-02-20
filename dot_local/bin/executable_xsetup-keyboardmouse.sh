#!/bin/bash

if [ "$DISPLAY" == "" ]; then
    echo "no \$DISPLAY"
    exit 0
else
    echo "current \$DISPLAY=${DISPLAY}"
fi

if [ "$DISPLAY" != ":0" ]; then
    echo "skip setup for non main display"
    exit 0
fi

# Key repeat
xset r rate 200 99

#xinput set-prop 13 299 1

inputDevices=$(xinput list --name-only)

# Thinkpad Trackpoint
if [[ $inputDevices =~ "Elan TrackPoint" ]]; then
    xinput --set-prop "pointer:TPPS/2 Elan TrackPoint" "libinput Accel Speed" 0.1
    xinput --set-prop "pointer:TPPS/2 Elan TrackPoint" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 0.5
fi

# Thinkpad Touchpad
if [[ $inputDevices =~ "Synaptics TM3289-002" ]]; then
    xinput --set-prop 'pointer:Synaptics TM3289-002' "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 0.5
    xinput --set-prop 'pointer:Synaptics TM3289-002' "libinput Accel Speed" -.1
fi

# MX Ergo
if [[ $inputDevices =~ "MX Ergo Mouse" ]]; then
  xinput --set-prop "pointer:MX Ergo Mouse" 'libinput Accel Speed' 0
  xinput --set-prop "pointer:MX Ergo Mouse" 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
fi

# M570
if [[ $inputDevices =~ "Logitech M570" ]]; then
  xinput --set-prop "pointer:Logitech M570" 'libinput Accel Speed' -.3
  xinput --set-prop "pointer:Logitech M570" 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
fi
