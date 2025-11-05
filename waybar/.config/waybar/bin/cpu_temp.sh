#!/bin/bash
# sensors
temp=$(sensors | grep 'Package id 0:' | awk '{print int($4)}' | tr -d '+°C')
echo " ${temp}°C"


