#!/usr/bin/env sh

PIDFILE="${TMPDIR:-/tmp}/omniwm-sketchybar-watch.pid"

if [ -f "$PIDFILE" ]; then
  old_pid=$(cat "$PIDFILE" 2>/dev/null)
  if [ -n "$old_pid" ] && kill -0 "$old_pid" 2>/dev/null; then
    exit 0
  fi
fi

printf '%s\n' "$$" > "$PIDFILE"
trap 'rm -f "$PIDFILE"' EXIT INT TERM

exec omniwmctl watch active-workspace --reconnect \
  --exec sketchybar --trigger omniwm_workspace_change
