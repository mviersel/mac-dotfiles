#!/bin/sh

MEDIA="$(osascript <<'EOF'
try
  tell application "Spotify"
    if it is running and player state is playing then
      return artist of current track & " - " & name of current track
    end if
  end tell
end try

try
  tell application "Music"
    if player state is playing then
      return artist of current track & " - " & name of current track
    end if
  end tell
end try

return ""
EOF
)"

if [ -z "$MEDIA" ]; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

TRIMMED="$(printf '%s' "$MEDIA" | awk '{ if (length($0) > 40) printf "%s...", substr($0, 1, 37); else printf "%s", $0 }')"

sketchybar --set "$NAME" drawing=on label="$TRIMMED"
