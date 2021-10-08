#!/bin/sh

sudo pacman -Syyu                        --noconfirm # Update system

# ==================================================
# Software used in scripts and configs
# ==================================================

# Install Xorg server
#sudo pacman -S xorg-xinit xorg --noconfirm
sudo pacman -S xdg-user-dirs             --noconfirm # Change names of default $HOME folders

sudo pacman -S alacritty                 --noconfirm # Terminal emulator
sudo pacman -S tmux                      --noconfirm # Terminal multiplexer
sudo pacman -S exa                       --noconfirm # A better ls
sudo pacman -S bat                       --noconfirm # A better less

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
sudo pacman -S ranger                    --noconfirm # Terminal file manager
sudo pacman -S qutebrowser               --noconfirm # Keyboard oriented browser
sudo pacman -S zathura                   --noconfirm # PDF viewer
sudo pacman -S zathura-pdf-mupdf         --noconfirm # PDF viewer
sudo pacman -S pandoc                    --noconfirm # Write PDF files with vim
sudo pacman -S texlive-core              --noconfirm # Needed to show images and compile pandoc

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
sudo pacman -S xbindkeys                 --noconfirm # Launch software and scripts
sudo pacman -S xorg-setxkbmap            --noconfirm # Swap esc and caps-lock
sudo pacman -S xorg-xset                 --noconfirm # Change keyboard input speed

# Extract files
sudo pacman -S tar                       --noconfirm # Extract files
sudo pacman -S unrar                     --noconfirm # Extract files
sudo pacman -S unzip                     --noconfirm # Extract files

# GUI software
sudo pacman -S nautilus                  --noconfirm # File manager
sudo pacman -S gnome-disk-utility        --noconfirm # View connected usb devices

# Other software
sudo pacman -S man                       --noconfirm # Manuals form commands
sudo pacman -S neofetch                  --noconfirm # Show system info
sudo pacman -S tree                      --noconfirm # Show files in a tree structure

# Dependencies
sudo pacman -S jq                        --noconfirm # ytfzf
sudo pacman -S ueberzug                  --noconfirm # ytfzf

# Install yay
cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R cesar:users ./yay
cd yay
makepkg -si --noconfirm

# AUR software
yay -S devour                            --noconfirm # Swallow windows
yay -S ytfzf                             --noconfirm # YouTube from the terminal
yay -S pacmixer                          --noconfirm # Sound manager
yay -S htop-vim                          --noconfirm # View system processes
yay -S keyd-git                          --noconfirm # Rebind keyboad

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
\cp -v home/bashrc /home/cesar/.bashrc
\cp -v home/zshrc /home/cesar/.zshrc
\cp -v home/xinitrc /home/cesar/.xinitrc
\cp -v home/tmux.conf /home/cesar/.tmux.conf

\cp -v home/xbindkeysrc /home/cesar/.xbindkeysrc
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

echo ""
echo "########################################"
echo "#             DWM compiled             #"
echo "########################################"
echo ""

# ==================================================
# Rebind keyboard
# ==================================================

# Rebind keyboard
cd /home/cesar/auto-install-arch/
sudo \cp other/keyd.cfg /etc/keyd/default.cfg
sudo systemctl restart keyd

# Modify < key
sudo \cp other/x11keys /usr/share/X11/xkb/symbols/pc

echo ""
echo "########################################"
echo "#           Keyboard Rebinded          #"
echo "########################################"
echo ""

# Set the wallpaper
#\feh --bg-fill /home/cesar/auto-install-arch/wallpaper.png
