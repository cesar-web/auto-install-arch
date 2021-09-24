#!/bin/sh

# script is used to bind a key in tmux to a menu that opens a file
file=$(echo "tmux vim.init bashrc zshrc xinitrc xbindkeysrc notes todo scripts->" | tr ' ' '\n' | fzf)
case "$file" in
    "tmux")        nvim ~/auto-install-arch/tmux.conf             ;;
    "bashrc")      nvim ~/auto-install-arch/bashrc                ;;
    "zshrc")       nvim ~/auto-install-arch/zshrc                 ;;
    "xinitrc")     nvim ~/auto-install-arch/xinitrc               ;;
    "xbindkeysrc") nvim ~/auto-install-arch/xbindkeysrc           ;;
    "notes")       nvim ~/documents/text_files/notes              ;;
    "todo")        nvim ~/documents/text_files/TODO               ;;
    "vim.init")    nvim ~/auto-install-arch/.config/nvim/init.vim ;;
    "scripts->")
        cd ~/auto-install-arch/scripts
        script=$(find . -type f | fzf)
        if [ "$script" != '' ]; then
            nvim "$script"
        fi
esac
