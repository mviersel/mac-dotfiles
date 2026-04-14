#!/bin/sh

LOCATION_JSON="$(curl -sf "https://ipwho.is/" 2>/dev/null)"

[ -z "$LOCATION_JSON" ] && exit 0

LATITUDE="$(printf '%s' "$LOCATION_JSON" | tr -d '\n' | awk -F'"latitude":' '{print $2}' | awk -F',' '{print $1}')"
LONGITUDE="$(printf '%s' "$LOCATION_JSON" | tr -d '\n' | awk -F'"longitude":' '{print $2}' | awk -F',' '{print $1}')"

[ -z "$LATITUDE" ] || [ -z "$LONGITUDE" ] && exit 0

WEATHER_JSON="$(curl -sf "https://api.open-meteo.com/v1/forecast?latitude=${LATITUDE}&longitude=${LONGITUDE}&current=temperature_2m,weather_code&temperature_unit=celsius" 2>/dev/null)"

[ -z "$WEATHER_JSON" ] && exit 0

CURRENT_JSON="$(printf '%s' "$WEATHER_JSON" | tr -d '\n' | awk -F'"current":\{' '{print $2}' | awk -F'\}' '{print $1}')"
TEMPERATURE="$(printf '%s' "$CURRENT_JSON" | awk -F'"temperature_2m":' '{print $2}' | awk -F',' '{print $1}')"
WEATHER_CODE="$(printf '%s' "$CURRENT_JSON" | awk -F'"weather_code":' '{print $2}' | awk -F',' '{print $1}')"

[ -z "$TEMPERATURE" ] || [ -z "$WEATHER_CODE" ] && exit 0

case "$WEATHER_CODE" in
  0) ICON="󰖙" ;;
  1|2) ICON="󰖕" ;;
  3) ICON="󰖐" ;;
  45|48) ICON="󰖑" ;;
  51|53|55|56|57|61|63|65|66|67|80|81|82) ICON="󰖗" ;;
  71|73|75|77|85|86) ICON="󰖘" ;;
  95|96|99) ICON="󰖓" ;;
  *) ICON="󰖙" ;;
esac

TEMPERATURE_LABEL="$(printf '%.0f°C' "$TEMPERATURE" 2>/dev/null)"

[ -z "$TEMPERATURE_LABEL" ] && exit 0

sketchybar --set "$NAME" icon="$ICON" label="$TEMPERATURE_LABEL"
