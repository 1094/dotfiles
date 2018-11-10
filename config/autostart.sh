#!/bin/bash
set -e

## both machines
compton -b &
feh --bg-fill $HOME/media/img/walls/* &
xautolock -time 20 -locker $HOME/txt/setting/locker &
unclutter -idle 2 &
/usr/lib/libpolkit-agent-1.so.0.0.0 &

## laptop only
#exec xmodmap -e "keycode 169 = Delete NoSymbol Delete" &
#exec xmodmap -e "keycode 66 = Mode_switch" &
#exec xmodmap -e "keycode 113 = Left NoSymbol Home" &
#exec xmodmap -e "keycode 114 = Right NoSymbol End" &
#exec xmodmap -e "keycode 111 = Up NoSymbol Prior" &
#exec xmodmap -e "keycode 116 = Down NoSymbol Next" &
#ibus-daemon -drx &
#dunst &

## desktop only
numlockx on &
xrandr --output LVDS --brightness .5 &
dbus-launch thunar --daemon &

# when copying to openbox/autostart
#$HOME/.config/polybar/launch &
