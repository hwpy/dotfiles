#!/bin/bash

if command -v touchegg >/dev/null 2>&1; then
  # pgrep -x touchegg >/dev/null || touchegg &
  pkill -x touchegg
  touchegg &
  echo "touchegg started"
fi
