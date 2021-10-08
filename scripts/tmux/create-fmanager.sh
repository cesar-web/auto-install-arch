#!/bin/sh

tmuxActive=$(tmux ls | grep "fmanager: " | wc -l)
if [ $tmuxActive -gt 0 ]; then
    tmux attach-session -t fmanager
else
    tmux new -s fmanager 'ranger'
fi
