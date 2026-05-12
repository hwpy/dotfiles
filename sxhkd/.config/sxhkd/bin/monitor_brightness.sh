#!/bin/bash

LOCKFILE="/tmp/monitor_brightness.lock"

(
flock -n 9 || exit 1

MONITOR=$1
CHANGE=$2
DDCUTIL=/usr/bin/ddcutil

CUR=$("$DDCUTIL" -d "$MONITOR" getvcp 10 2>/dev/null | grep -oP 'current value\s*=\s*\K\d+')
MAX=$("$DDCUTIL" -d "$MONITOR" getvcp 10 2>/dev/null | grep -oP 'max value\s*=\s*\K\d+')

[ -z "$CUR" ] && exit 1
[ -z "$MAX" ] && exit 1

NEW=$(( CUR + CHANGE ))

[ "$NEW" -lt 0 ] && NEW=0
[ "$NEW" -gt "$MAX" ] && NEW=$MAX

"$DDCUTIL" -d "$MONITOR" setvcp 10 "$NEW"

) 9>"$LOCKFILE"
