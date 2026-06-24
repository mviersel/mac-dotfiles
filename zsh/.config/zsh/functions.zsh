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
