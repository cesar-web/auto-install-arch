#!bin/sh

cd
file="$(find * ~/.config/ ~/.bashrc ~/.zshrc ~/.xbindkeysrc ~/.xinitrc /run/media/ -type f |\
    fzf --sort --preview="dash ~/scripts/keybind/find_file/file_preview.sh {}"\
    --preview-window="top,80%")"

# Get file extension
extension=$(echo ${file} | awk -F . '{print $NF}')
extension=$(echo ${extension} | awk '{print tolower($0)}')

# Get file directory and cd into it
# This is so coc can work correctly
absolutedir=$(echo $file | sed 's%/[^/]*$%/%')
cd "$absolutedir"

# Strip filename and replace spaces with '\ '
file=$(echo $file | sed "s/.*\///")
file=$(echo $file | sed 's! !\\ !g')

# Dont open vim if the user quit
if [ "$file" != '' ]; then
    dash ~/scripts/general/open_file.sh "$file"
fi
