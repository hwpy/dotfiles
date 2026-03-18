#!/bin/sh
if [ "$XDG_SESSION_DESKTOP" = "bspwm" ]; then
    # BSPWM сессия
    unset SESSION_MANAGER
    export XDG_SESSION_DESKTOP=bspwm
    exec bspwm
elif [ "$XDG_SESSION_DESKTOP" = "xfce" ]; then
    exec startxfce4
elif [ "$XDG_SESSION_DESKTOP" = "gnome" ]; then
    # GNOME сессия
    unset SESSION_MANAGER
    exec gnome-session
else
    # Plasma по умолчанию
    unset SESSION_MANAGER
    exec /usr/lib/plasma-dbus-run-session-if-needed startplasma-x11
fi
