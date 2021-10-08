#!/bin/sh

tmuxActive=$(tmux ls | grep "music: " | wc -l)
if [ $tmuxActive -gt 0 ]; then
    tmux attach-session -t music
else
    tmux new -s music 'ytfzf -l -s -m'
fi
