#!/bin/bash
killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

polybar main &

# Проверяем, подключён ли внешний монитор HDMI-1
if xrandr | grep "^HDMI-1 connected" >/dev/null; then
    polybar external &
fi

