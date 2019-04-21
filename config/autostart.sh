#!/bin/bash
set -e

## both machines
compton -b &
/home/sir/.fehbg &
xautolock -time 20 -locker /usr/local/bin/locker &
unclutter --timeout 2 --ignore-scrolling &
/usr/lib/libpolkit-agent-1.so.0.0.0 &
dbus-launch pcmanfm -d &
dunst &
fcitx -dr &

## desktop
#numlockx on &
#xrandr --output LVDS --brightness .5 &
