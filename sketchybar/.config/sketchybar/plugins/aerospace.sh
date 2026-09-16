#!/usr/bin/env sh

ACCENT_COLOR=0xffffffff
TEXT_COLOR=0xfff5f5f5
MUTED_COLOR=0xffffffff
WORKSPACE="$1"
FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"

if [ "$WORKSPACE" = "$FOCUSED" ]; then
    sketchybar --set "$NAME" icon="●" icon.color="$ACCENT_COLOR"
else
    sketchybar --set "$NAME" icon="○" icon.color="$MUTED_COLOR"
fi
