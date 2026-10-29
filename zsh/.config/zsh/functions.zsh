#!/usr/bin/env bash
# yazi function
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

write() {
    figlet "$*"
}

tmx() {
  local template="$1"
  "$HOME/tmux-templates/$template.sh"
}

amnirules() (
  set -euo pipefail

  omniwmctl query windows --format json |
    jq -r '
      .result.payload.windows[]
      | .pid
      | select(. != null)
    ' |
    sort -u |
    while read -r pid; do
      echo "Applying rules to PID: $pid"
      omniwmctl rule apply --pid "$pid"
    done
)

kitty-reload() {
    kill -SIGUSR1 $(pidof kitty)
}

bundleid() {
    if [[ -z "$1" ]]; then
        echo "Gebruik: bundleid <appnaam>" >&2
        return 1
    fi

    local id
    id=$(osascript - "$1" <<'APPLESCRIPT' 2>/dev/null
on run argv
    set appName to item 1 of argv
    return id of application appName
end run
APPLESCRIPT
    )

    if [[ -z "$id" ]]; then
        echo "Applicatie niet gevonden: $1" >&2
        return 1
    fi

    printf '%s\n' "$id"
}
