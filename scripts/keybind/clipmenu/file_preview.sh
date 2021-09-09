#!bin/sh

# find file that contains clipboard text
clipboard_head=$1

# remove the (xyz lines) text at the end
clipboard_head=$(echo $clipboard_head | sed 's/ ([0-9]\+ lines)//')

# show matching files
files_matched=$(grep -li "$clipboard_head" $XDG_RUNTIME_DIR/clipmenu.6.cesar/*)

# only get first result
first_file=$(echo $files_matched | awk '{print $1}{print $2}')
first_file=$(echo $first_file | tr -d '\n')

# print the result and wrap the line
cat "$first_file" | fold -w 100
