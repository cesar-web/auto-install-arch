#!/bin/sh

# script is used to bind a key in tmux to a menu that opens a file
file=$(echo "tmux vim.init bashrc zshrc xinitrc xbindkeysrc notes todo keybinds scripts->" | tr ' ' '\n' | fzf)
case "$file" in
    "tmux")        nvim ~/auto-install-arch/home/tmux.conf             ;;
    "bashrc")      nvim ~/auto-install-arch/home/bashrc                ;;
    "zshrc")       nvim ~/auto-install-arch/home/zshrc                 ;;
    "xinitrc")     nvim ~/auto-install-arch/home/xinitrc               ;;
    "xbindkeysrc") nvim ~/auto-install-arch/home/xbindkeysrc           ;;
    "keybinds")    nvim ~/auto-install-arch/other/keyd.cfg              ;;
    "notes")       nvim ~/documents/text_files/notes              ;;
    "todo")        nvim ~/documents/text_files/TODO               ;;
    "vim.init")    nvim ~/auto-install-arch/.config/nvim/init.vim ;;
    "scripts->")
        cd ~/auto-install-arch/scripts/
        script=$(find . -type f | fzf \
            --preview="dash ~/scripts/keybind/find_file/file_preview.sh {}" \
            --preview-window="top,80%")
        if [ "$script" != '' ]; then
            nvim "$script"
        fi
esac
