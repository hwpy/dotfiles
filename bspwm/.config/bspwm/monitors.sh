#!/bin/sh

# Машино-зависимые переменные
source "$HOME/.config/env/env"

# Автоопределение подключённых мониторов
PRIMARY_MONITOR=$(xrandr --listmonitors | awk 'NR==2{print $4; exit}')
SECONDARY_MONITOR=$(xrandr --listmonitors | awk 'NR==3{print $4; exit}')

# Экспорт для других скриптов
export INTERNAL_MONITOR EXTERNAL_MONITOR PRIMARY_MONITOR SECONDARY_MONITOR
