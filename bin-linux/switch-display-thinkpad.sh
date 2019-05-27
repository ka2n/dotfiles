#!/bin/sh
# TODO: 並べるモードも用意したい
# https://gist.github.com/rpromyshlennikov/7d6d2432242eca596eb543d35702e742

#For identifying our monitors use xrandr tool and view output
LVDS=eDP1      # could be another one like: LVDS, LVDS-1, etc
DP=DP1
HDMI=HDMI1        # could be another one like: HDMI, HDMI-1, etc
EXTRA="--right-of $LVDS" # addtional info while dual display

# Lets check both LVDS and HDMI state from the string "$display connected "
xrandr | grep -q "^$LVDS connected " && LVDS_IS_CON=1 || LVDS_IS_CON=0
xrandr | grep -q "^$HDMI connected " && HDMI_IS_CON=1 || HDMI_IS_CON=0
xrandr | grep -q "^$DP connected " && DP_IS_CON=1 || DP_IS_CON=0
xrandr --listmonitors | grep -q "\s$LVDS" && LVDS_IS_ON=1 || LVDS_IS_ON=0
xrandr --listmonitors | grep -q "\s$HDMI" && HDMI_IS_ON=1 || HDMI_IS_ON=0
xrandr --listmonitors | grep -q "\s$DP" && DP_IS_ON=1 || DP_IS_ON=0

# Output switch cycle
if [ $HDMI_IS_ON -eq 1 ] || [ $DP_IS_ON -eq 1 ]; then
    echo "LVDS: on, HDMI: off, DP: off"
    xrandr --output $LVDS --auto
    xrandr --output $HDMI --off
    xrandr --output $DP --off
elif [ $LVDS_IS_ON -eq 1 ] && [ $HDMI_IS_CON -eq 1 ]; then
    echo "LVDS: off, HDMI: on, DP: off"
    xrandr --output $LVDS --off
    xrandr --output $DP --off
    xrandr --output $HDMI --auto
elif [ $LVDS_IS_ON -eq 1 ] && [ $DP_IS_CON -eq 1 ]; then
    echo "LVDS: off, HDMI: off, DP: on"
    xrandr --output $LVDS --off
    xrandr --output $HDMI --off
    xrandr --output $DP --auto
else
    echo "Connected: LVDS: ${LVDS_IS_CON}, HDMI: ${HDMI_IS_CON}, DP: ${DP_IS_CON}"
    echo "On: LVDS: ${LVDS_IS_ON}, HDMI: ${HDMI_IS_ON}, DP: ${DP_IS_ON}"
    xrandr --output $LVDS --auto
fi
