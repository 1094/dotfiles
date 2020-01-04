#!/bin/bash
set -e

## both machines
compton -b &
/home/sir/.fehbg &
xautolock -time 20 -locker /usr/local/bin/locker &
unclutter --timeout 2 --ignore-scrolling &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dbus-launch pcmanfm -d &
dunst &
fcitx -dr &
nm-applet &
octopi-notifier &
opensnitch-u &

## desktop
#numlockx on &
#xrandr --output LVDS --brightness .5 &
