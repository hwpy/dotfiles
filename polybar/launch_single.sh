#!/bin/bash
killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

polybar --config=$HOME/.config/polybar/config_single.ini main &

# Проверяем, подключён ли внешний монитор HDMI-1
if xrandr | grep "^HDMI-1 connected" >/dev/null; then
    polybar --config=$HOME/.config/polybar/config_single.ini external &
fi

