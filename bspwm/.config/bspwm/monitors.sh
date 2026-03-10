#!/bin/sh

# Имена мониторов
INTERNAL_MONITOR="HDMI-0"
EXTERNAL_MONITOR="DVI-D-0"

# Автоопределение подключённых мониторов
PRIMARY_MONITOR=$(xrandr --listmonitors | awk 'NR==2{print $4; exit}')
SECONDARY_MONITOR=$(xrandr --listmonitors | awk 'NR==3{print $4; exit}')

# Экспорт для других скриптов
export INTERNAL_MONITOR EXTERNAL_MONITOR PRIMARY_MONITOR SECONDARY_MONITOR
