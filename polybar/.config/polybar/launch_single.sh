#!/bin/bash

source "$HOME/.config/env/env"

F=${HIDPI_FACTOR:-100}
cat > "$HOME/.config/polybar/scale_active.ini" <<SCALE
[bar/main]
height = $((20 * F / 100))pt
font-0 = "JetBrains Mono Nerd Font:pixelsize=$((10 * F / 100));3"
font-1 = "Symbols Nerd Font:style=Regular:size=$((12 * F / 100));6"
SCALE

# Загружаем текущую цветовую схему
CURRENT_SCHEME=$(cat $HOME/.config/colors/current_scheme)

# Создаем символическую ссылку на текущую схему
ln -sf "$HOME/.config/colors/schemes/$CURRENT_SCHEME.conf" "$HOME/.config/colors/current.conf"

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

polybar --config=$HOME/.config/polybar/config_single.ini main &

# Проверяем, подключён ли внешний монитор HDMI-1
if xrandr | grep "^${EXTERNAL_MONITOR} connected" >/dev/null; then
    polybar --config=$HOME/.config/polybar/config_single.ini external &
fi