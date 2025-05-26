#!/bin/sh

chosen=$(echo -e " Блокировка\n⏾ Сон\n Перезагрузка\n Выключение\n Выход" | rofi -dmenu -i -p "Выберите действие:")

case "$chosen" in
    " Блокировка")
        slock
        ;;
    "⏾ Сон")
        systemctl suspend
        ;;
    " Перезагрузка")
        systemctl reboot
        ;;
    " Выключение")
        systemctl poweroff
        ;;
    " Выход")
        # Команда выхода из сессии зависит от используемого окружения
        # Например, для Xfce:
        # xfce4-session-logout --logout
        # Для i3:
        # i3-msg exit
        # Для GNOME:
        # gnome-session-quit --logout --no-prompt
        # Здесь пример для generic X session:
        pkill -KILL -u $USER
        ;;
esac

