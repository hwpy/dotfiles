#!/bin/bash

LOCK_COLOR="1a1a1a"

swayidle -w \
  timeout 300 "swaylock -f -c $LOCK_COLOR" \
  timeout 330 "hyprctl dispatch dpms off" \
  resume "hyprctl dispatch dpms on" \
  before-sleep "swaylock -f -c $LOCK_COLOR"

