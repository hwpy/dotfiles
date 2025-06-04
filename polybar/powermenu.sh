#!/bin/sh

chosen=$(echo -e " Блокировка\n󰤄 Сон\n Перезагрузка\n󰐥 Выключение\n󰗼 Выход" | rofi -dmenu -i -p "Выберите действие:")

case "$chosen" in
    " Блокировка")
        $HOME/.config/bspwm/bin/lock
        ;;
    "󰤄 Сон")
        systemctl suspend
        ;;
    " Перезагрузка")
        systemctl reboot
        ;;
    "󰐥 Выключение")
        systemctl poweroff
        ;;
    "󰗼 Выход")
        pkill -KILL -u $USER
        ;;
esac

