#!/bin/bash

# Dbus fix
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# keymap
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap &
/usr/bin/xdg-user-dirs-update &

# Xresources w/o the defaults
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &

# load the desktop
exec i3
