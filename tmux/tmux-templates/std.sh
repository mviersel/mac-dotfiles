#!/usr/bin/evn bash
set -euo pipefail

# name of the tmux session
SESSION="std"
# location of the session, ~/user/name
DIR="$HOME"

# check if there is a session named "home"
if tmux has-session -t "$SESSION" 2>/dev/null; then
    exec tmux attach-session -t "$SESSION"
fi

# make new session named "home" within "~/user/home"
tmux new-session -d -s "$SESSION" -c "$DIR"

tmux rename-window -t "$SESSION:1" "home"
tmux new-window -t "$SESSION" -n "dotfiles" -c "$HOME/mac-dotfiles/"
tmux new-window -t "$SESSION" -n "obsidian" -c "$HOME/obidian/"
tmux new-window -t "$SESSION" -n "opencode" -c "$HOME"

tmux send-keys -t "$SESSION:1" -n "yazi"
tmux send-keys -t "$SESSION:2" -n ""
tmux send-keys -t "$SESSION:3" -n "nvim ."

exec tmux attach-session -t "$SESSION"
