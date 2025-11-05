#!/bin/bash

# Меню с вариантами
menu="Logout\nReboot\nShutdown\nSuspend\nCancel"

# Запуск wofi с меню и выбор пункта
selected=$(echo -e "$menu" | wofi --dmenu --width 480 --height 180 -p "Power Menu")

# Обработка выбора
case "$selected" in
    Logout)
        hyprctl dispatch exit                        # Выход из сессии Hyprland
        ;;
    Reboot)
        systemctl reboot                             # Перезагрузка системы
        ;;
    Shutdown)
        systemctl poweroff                           # Выключение системы
        ;;
    Suspend)
        swaylock -c 1a1a1a & systemctl suspend       # Сон
        ;;
    Cancel|*)
        exit 0                                       # Отмена или закрытие меню
        ;;
esac

