#!/bin/sh

AIRPORT_DATA="$(system_profiler SPAirPortDataType 2>/dev/null)"

if ! printf '%s' "$AIRPORT_DATA" | grep -q 'Status: Connected'; then
  sketchybar --set "$NAME" icon="󰤮"
  exit 0
fi

RSSI="$(printf '%s' "$AIRPORT_DATA" | awk '/Signal \/ Noise:/ {print $4; exit}')"

case "$RSSI" in
  '' ) ICON="󰤮" ;;
  -[0-4][0-9]|-50) ICON="󰤨" ;;
  -5[1-9]|-6[0-7]) ICON="󰤥" ;;
  -6[8-9]|-7[0-5]) ICON="󰤢" ;;
  *) ICON="󰤟" ;;
esac

sketchybar --set "$NAME" icon="$ICON"
