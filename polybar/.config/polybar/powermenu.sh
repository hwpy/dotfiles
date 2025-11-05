#!/bin/sh

if echo "$LANG" | grep -q "^ru"; then
    MENU=" Блокировка\n󰤄 Сон\n Перезагрузка\n󰐥 Выключение\n󰗼 Выход"
    LOCK="Блокировка"
    SUSPEND="Сон"
    REBOOT="Перезагрузка"
    POWEROFF="Выключение"
    LOGOUT="Выход"
    PROMPT="Выберите действие:"
else
    MENU=" Lock\n󰤄 Suspend\n Reboot\n󰐥 Poweroff\n󰗼 Logout"
    LOCK="Lock"
    SUSPEND="Suspend"
    REBOOT="Reboot"
    POWEROFF="Poweroff"
    LOGOUT="Logout"
    PROMPT="Choose action:"
fi

chosen=$(echo -e "$MENU" | rofi -dmenu -i -p "$PROMPT")

case "$chosen" in
    *"$LOCK"*)
        $HOME/.config/bspwm/bin/lock
        ;;
    *"$SUSPEND"*)
        systemctl suspend
        ;;
    *"$REBOOT"*)
        systemctl reboot
        ;;
    *"$POWEROFF"*)
        systemctl poweroff
        ;;
    *"$LOGOUT"*)
        pkill -KILL -u $USER
        ;;
esac
