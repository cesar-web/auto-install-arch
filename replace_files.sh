#!bin/sh

sudo echo "Replacing files"

# Replace home files
\cp bashrc /home/cesar/.bashrc
\cp zshrc /home/cesar/.zshrc
\cp xinitrc /home/cesar/.xinitrc
\cp tmux.conf /home/cesar/.tmux.conf

\cp xbindkeysrc /home/cesar/.xbindkeysrc
xbindkeys --poll-rc

# Replace directories
\cp -r .config/ /home/cesar/
\cp -r scripts/ /home/cesar/
\cp -r programs/ /home/cesar/

# Rebind keyboard
cd /home/cesar/auto-install-arch/
sudo \cp other/keyd.cfg /etc/keyd/default.cfg
sudo systemctl restart keyd

# Modify < key
sudo \cp other/keyd.cfg /usr/share/X11/xkb/symbols/pc

echo ""
echo "########################################"
echo "#          All files replaced          #"
echo "########################################"
echo ""

# Compile dwm
\cd ~/programs/dwm/
sudo make clean install
