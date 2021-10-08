#!/bin/sh

tmuxActive=$(tmux ls | grep "default: " | wc -l)
if [ $tmuxActive -gt 0 ]; then
    tmux attach-session -t default
else
    tmux new -s default
fi
