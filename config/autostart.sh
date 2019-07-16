#!/bin/bash
set -e

## both machines
compton -b &
/home/sir/.fehbg &
xautolock -time 20 -locker /home/sir/txt/locker &
unclutter --timeout 2 --ignore-scrolling &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dbus-launch pcmanfm -d &
dunst &
fcitx -dr &
nm-applet &
octopi-notifier &
#tint2
#/home/sir/.config/polybar/launch


## desktop
#numlockx on &
#xrandr --output LVDS --brightness .5 &
