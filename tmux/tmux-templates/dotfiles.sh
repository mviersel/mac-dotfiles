#!/usr/bin/env bash
set -euo pipefail

SESSION="dotfiles"
DIR="$HOME/.dotfiles"

if ! tmux has-session -t "$SESSION" 2>/dev/null; then
    tmux new-session -d -s "$SESSION" -n main -c "$DIR"

    tmux send-keys -t "$SESSION:main.0" "lazygit" C-m

    tmux split-window -h -t "$SESSION:main" -c "$DIR"
    tmux send-keys -t "$SESSION:main.1" "zsh" C-m

    tmux split-window -v -t "$SESSION:main.1" -c "$DIR"
    tmux send-keys -t "$SESSION:main.2" "yazi" C-m

    tmux select-pane -t "$SESSION:main.0"
fi

tmux attach-session -t "$SESSION"
