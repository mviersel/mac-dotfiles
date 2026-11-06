#!/usr/bin/env sh

ACCENT_COLOR=0xffffffff
MUTED_COLOR=0xffffffff
WORKSPACE="$1"

CURRENT="$({
  omniwmctl query workspaces --current --format json 2>/dev/null || exit 0
} | jq -r '.result.payload.workspaces[0].number // empty')"

if [ "$WORKSPACE" = "$CURRENT" ]; then
  sketchybar --set "$NAME" icon="●" icon.color="$ACCENT_COLOR"
else
  sketchybar --set "$NAME" icon="○" icon.color="$MUTED_COLOR"
fi
