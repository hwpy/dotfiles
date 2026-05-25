#!/bin/bash

if command -v touchegg >/dev/null 2>&1; then
  pkill -x touchegg
  touchegg &
  echo "touchegg started"
fi
