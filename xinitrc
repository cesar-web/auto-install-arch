#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# rebind keyboard
dash ~/scripts/loop/change_keyboard_layout.sh &
numlockx &

# add personal keybindings
xbindkeys &

# start clipmenu
clipmenud &

# auto hide mouse
unclutter -idle 10 --jitter 80 &

# load statusbar and wallpaper
/home/cesar/scripts/loop/dwmstatus.sh &
~/.fehbg &

# speed up keyboard
xset r rate 250 35 &

exec dwm
