#!/bin/sh

sudo pacman -Syyu                        --noconfirm # Update system

# ==================================================
# Software used in scripts and configs
# ==================================================

# Install Xorg server
#sudo pacman -S xorg-xinit xorg --noconfirm

sudo pacman -S alacritty                 --noconfirm # Terminal emulator
sudo pacman -S exa                       --noconfirm # A better ls

# Shells
sudo pacman -S dash                      --noconfirm # Fast shell for scripting
sudo pacman -S zsh                       --noconfirm # Shell I use

# Multimedia
sudo pacman -S feh                       --noconfirm # Image viewer and wallpaper setter
sudo pacman -S mpv                       --noconfirm # Audio and video player
sudo pacman -S vim                       --noconfirm # Text editor
sudo pacman -S gvim                      --noconfirm # Text editor
sudo pacman -S neovim                    --noconfirm # Text editor
sudo pacman -S nodejs                    --noconfirm # Needed for vim coc
sudo pacman -S qutebrowser               --noconfirm # Keyboard oriented browser
sudo pacman -S zathura                   --noconfirm # PDF viewer
sudo pacman -S zathura-pdf-mupdf         --noconfirm # PDF viewer

# Scripting
sudo pacman -S fzf                       --noconfirm # Fuzzy finder for scripting
sudo pacman -S clipmenu                  --noconfirm # Clipboard manager
sudo pacman -S mediainfo                 --noconfirm # View file metadata
sudo pacman -S pygmentize                --noconfirm # Cat with syntax highlight
sudo pacman -S rofi                      --noconfirm # Software launcher
sudo pacman -S ttf-jetbrains-mono        --noconfirm # Font
sudo pacman -S viu                       --noconfirm # Preview images in terminal
sudo pacman -S xclip                     --noconfirm # Used for screenshots

# Keyboard remamps
sudo pacman -S numlockx                  --noconfirm # Auto enable num lock on keyboard
sudo pacman -S xbindkeys                 --noconfirm # Custom keybindings
sudo pacman -S xorg-setxkbmap            --noconfirm # Used to rebind the keyboard

# Extract files
sudo pacman -S tar                       --noconfirm # Extract files
sudo pacman -S unrar                     --noconfirm # Extract files
sudo pacman -S unzip                     --noconfirm # Extract files

# Other software
sudo pacman -S htop                      --noconfirm # View system processes
sudo pacman -S man                       --noconfirm # Manuals form commands
sudo pacman -S neofetch                  --noconfirm # Show system info
sudo pacman -S tree                      --noconfirm # Show files in a tree structure

# AUR software
yay -S devour                            --noconfirm # Swallow windows
yay -S ytfzf                             --noconfirm # YouTube from the terminal
sudo pacman -S jq                        --noconfirm # ytfzf dependency
sudo pacman -S ueberzug                  --noconfirm # ytfzf dependency

echo ""
echo "########################################"
echo "#          Installed software          #"
echo "########################################"
echo ""

# ==================================================
# Create directories my configs will need
# ==================================================
mkdir /home/cesar/.config
mkdir /home/cesar/scripts
mkdir /home/cesar/programs

echo ""
echo "########################################"
echo "#          Created directories         #"
echo "########################################"
echo ""

# ==================================================
# Place personal configs in folders
# ==================================================
cd /home/cesar/auto-install-arch/

# Replace home files
\cp -v bashrc /home/cesar/.bashrc
\cp -v zshrc /home/cesar/.zshrc
\cp -v xinitrc /home/cesar/.xinitrc

\cp -v xbindkeysrc /home/cesar/.xbindkeysrc
xbindkeys --poll-rc

# Replace directories
\cp -v -r .config/ /home/cesar/
\cp -v -r scripts/ /home/cesar/
\cp -v -r programs/ /home/cesar/

# Install VimPlug for Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo ""
echo "########################################"
echo "#         All configs replaced         #"
echo "########################################"
echo ""

# ==================================================
# Install window manager and st
# ==================================================

# Build dwm
cd /home/cesar/programs/dwm/
sudo make clean install

# Build st
cd /home/cesar/programs/st/
sudo make clean install

echo ""
echo "########################################"
echo "#             DWM compiled             #"
echo "########################################"
echo ""

# Set the wallpaper
\feh --bg-fill /home/cesar/auto-install-arch/wallpaper.png
