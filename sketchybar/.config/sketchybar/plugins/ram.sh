#!/bin/sh

USED_PERCENT="$(vm_stat | awk -v total_bytes="$(sysctl -n hw.memsize)" 'BEGIN {pagesize=4096} /Pages active/ {active=$3} /Pages wired down/ {wired=$4} /Pages occupied by compressor/ {compressed=$5} END {gsub(/\./, "", active); gsub(/\./, "", wired); gsub(/\./, "", compressed); used_bytes=(active+wired+compressed)*pagesize; printf "%d%%", (used_bytes / total_bytes) * 100 + 0.5}')"

[ -z "$USED_PERCENT" ] && exit 0

sketchybar --set "$NAME" label="$USED_PERCENT"
