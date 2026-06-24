#!/usr/bin/env bash
set -euo pipefail

SESSION="home"
DIR="$HOME"

if ! tmux has-session -t "$SESSION" 2>/dev/null; then
    tmux new-session -d -s "$SESSION" -n main -c "$DIR"
    tmux send-keys -t "$SESSION:main.0" "yazi" C-m
fi

tmux attach-session -t "$SESSION"
