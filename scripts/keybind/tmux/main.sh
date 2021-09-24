#!/bin/sh

tmuxActive=$(tmux ls | grep "0: " | wc -l)
if [ $tmuxActive -gt 0 ]; then
    tmux attach-session -t 0
else
    tmux
fi
