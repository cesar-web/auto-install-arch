#!/bin/sh

if [ -f $1 ] ; then
    file_extension=$(echo ${1} | awk -F . '{print $NF}')
    file_extension=$(echo ${file_extension} | awk '{print tolower($0)}')

    case $file_extension in
        mp3 ) devour mpv $1 ;;
        wav ) devour mpv $1 ;;
        wma ) devour mpv $1 ;;
        flac) devour mpv $1 ;;

        mp4 ) devour mpv $1 ;;
        mov ) devour mpv $1 ;;
        wmv ) devour mpv $1 ;;

        jpg ) devour feh --scale-down $1 ;;
        jpeg) devour feh --scale-down $1 ;;
        png ) devour feh --scale-down $1 ;;
        gif ) devour feh --scale-down $1 ;;
        webp) devour feh --scale-down $1 ;;

        pdf ) devour zathura $1 ;;
        epub) devour zathura $1 ;;

        *) nvim $1
    esac
fi
