#!/usr/bin/env bash
set -euo pipefail

SESSION="opencode"
DIR="$HOME"

if ! tmux has-session -t "$SESSION" 2>/dev/null; then
    tmux new-session -d -s "$SESSION" -n agent -c "$DIR"
    tmux send-keys -t "$SESSION:agent.0" "opencode" C-m

    tmux new-window -t "$SESSION" -n shell -c "$DIR"
    tmux send-keys -t "$SESSION:shell.0" "zsh" C-m

    tmux select-window -t "$SESSION:agent"
fi

tmux attach-session -t "$SESSION"
