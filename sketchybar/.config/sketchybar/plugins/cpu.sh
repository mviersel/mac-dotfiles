#!/bin/sh

CPU_USAGE="$(top -l 1 -n 0 | awk -F'[:,% ]+' '/CPU usage/ {printf "%.0f", $3 + $5}')"

[ -z "$CPU_USAGE" ] && exit 0

sketchybar --set "$NAME" label="$CPU_USAGE%"
