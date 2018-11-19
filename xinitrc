#!/bin/bash

export DE=openbox

# Dbus fix
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

/usr/bin/xdg-user-dirs-update

# exec openbox-session
exec i3

