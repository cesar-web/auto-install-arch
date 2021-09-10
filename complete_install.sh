#!/bin/sh

sudo pacman -Syu                         --noconfirm # Update system

# Software used in scripts and configs
sudo pacman -S alacritty                 --noconfirm # Terminal emulator
sudo pacman -S feh                       --noconfirm # Image viewer and wallpaper setter
sudo pacman -S mpv                       --noconfirm # Audio and video player
sudo pacman -S fzf                       --noconfirm # Fuzzy finder for scripting
sudo pacman -S viu                       --noconfirm # Preview images in terminal
sudo pacman -S mediainfo                 --noconfirm # View file metadata
sudo pacman -S pygmentize                --noconfirm # Cat with syntax highlight
sudo pacman -S zathura zathura-pdf-mupdf --noconfirm # PDF viewer
sudo pacman -S clipmenu                  --noconfirm # Clipboard manager
sudo pacman -S neovim gvim               --noconfirm # Text editor
sudo pacman -S qutebrowser               --noconfirm # Keyboard oriented browser
sudo pacman -S rofi                      --noconfirm # Software launcher
sudo pacman -S ttf-jetbrains-mono        --noconfirm # Font
sudo pacman -S exa                       --noconfirm # A better ls
sudo pacman -S xclip                     --noconfirm # Used for screenshots

sudo pacman -S xorg-setxkbmap            --noconfirm # Used to rebind the keyboard
sudo pacman -S numlockx                  --noconfirm # Auto enable num lock on keyboard
sudo pacman -S xbindkeys                 --noconfirm # Custom keybindings

sudo pacman -S dash                      --noconfirm # Fast shell for scripting
sudo pacman -S zsh                       --noconfirm # Shell

sudo pacman -S tar                       --noconfirm # Extract files
sudo pacman -S unrar                     --noconfirm # Extract files
sudo pacman -S unzip                     --noconfirm # Extract files

# Other software
sudo pacman -S neofetch                  --noconfirm # Show system info
sudo pacman -S htop                      --noconfirm # View system processes
sudo pacman -S man                       --noconfirm # Manuals form commands

# Make all directories the script will use
cd ~
mkdir programs
mkdir scripts

mkdir .config
mkdir .config/alacritty
mkdir .config/clipster
mkdir .config/mpv
mkdir .config/nvim
mkdir .config/qutebrowser
mkdir .config/ytfzf
mkdir .config/zathura

# Install Xorg server
sudo pacman -S xorg-xinit xorg --noconfirm

# Make programs folder to install suckless utilities
cd programs

# Install dwm
git clone https://git.suckless.org/dwm
cd dwm; sudo make clean install; cd ..

# Install st
git clone https://git.suckless.org/st
cd st; sudo make clean install; cd ..

