#!/bin/sh

VOLUME="$INFO"

if [ -z "$VOLUME" ]; then
  VOLUME="$(osascript -e 'output volume of (get volume settings)' 2>/dev/null)"
fi

OUTPUT_DEVICE="$(system_profiler SPAudioDataType 2>/dev/null | awk '
  /^        [^ ]/ {
    device = $0
    sub(/^        /, "", device)
    sub(/:$/, "", device)
  }
  /Default Output Device: Yes/ {
    print device
    exit
  }
')"

case "$OUTPUT_DEVICE" in
  *AirPods*|*Headphone*|*Headset*|*Buds*|*Earphone*|*WH-*|*WF-*|*Beats*|*QuietComfort*|*XM[0-9]*)
    ICON="󰋋"
    ;;
  *)
    case "$VOLUME" in
      [6-9][0-9]|100) ICON="󰕾" ;;
      [3-5][0-9]) ICON="󰖀" ;;
      [1-9]|[1-2][0-9]) ICON="󰕿" ;;
      *) ICON="󰖁" ;;
    esac
    ;;
esac

sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%"
