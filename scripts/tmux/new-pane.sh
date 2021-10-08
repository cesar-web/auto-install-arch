#!/bin/sh

sessionName=$(tmux display-message -p '#S')

case $sessionName in
    default ) dash ~/scripts/general/open_config.sh    ;;
    music   ) bash ytfzf -l -s -m                      ;;
    *       ) dash ~/scripts/keybind/find_file/main.sh ;;
esac
