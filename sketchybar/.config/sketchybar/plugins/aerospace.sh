#!/usr/bin/env sh

ACCENT_COLOR=0xff9aa8c4
TEXT_COLOR=0xffb8c0cc
MUTED_COLOR=0xff59636f
WORKSPACE="$1"
FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"

if [ "$WORKSPACE" = "$FOCUSED" ]; then
    sketchybar --set "$NAME" icon="●" icon.color="$ACCENT_COLOR"
else
    sketchybar --set "$NAME" icon="○" icon.color="$MUTED_COLOR"
fi
