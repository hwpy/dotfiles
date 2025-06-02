#!/bin/bash

# Убить все старые бары
killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

# Запустить все секции для каждого монитора
polybar --config=$HOME/.config/polybar/config_separate.ini arch &
polybar --config=$HOME/.config/polybar/config_separate.ini bspwm &
polybar --config=$HOME/.config/polybar/config_separate.ini date &
polybar --config=$HOME/.config/polybar/config_separate.ini system &
polybar --config=$HOME/.config/polybar/config_separate.ini powermenu &


# Проверяем, подключён ли внешний монитор HDMI-1
if xrandr | grep "^HDMI-1 connected" >/dev/null; then
  polybar --config=$HOME/.config/polybar/config_separate.ini external_arch &
  polybar --config=$HOME/.config/polybar/config_separate.ini external_bspwm &
  polybar --config=$HOME/.config/polybar/config_separate.ini external_date &
  polybar --config=$HOME/.config/polybar/config_separate.ini external_system &
  polybar --config=$HOME/.config/polybar/config_separate.ini external_powermenu &
fi
