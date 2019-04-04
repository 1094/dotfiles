#!/bin/bash
set -e

## both machines
compton -b &
/home/sir/.fehbg &
/usr/local/bin/auto-lock-setting &
unclutter --timeout 2 --ignore-scrolling &
/usr/lib/libpolkit-agent-1.so.0.0.0 &
dbus-launch pcmanfm -d &
dunst &
fcitx -dr &
xfce4-power-manager &
nm-applet &

## desktop
#numlockx on &
#xrandr --output LVDS --brightness .5 &
