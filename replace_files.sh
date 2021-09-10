#!bin/sh

sudo sudo

# Replace home files
\cp bashrc ~/.bashrc
\cp zshrc ~/.zshrc
\cp xinitrc ~/.xinitrc

\cp xbindkeysrc ~/.xbindkeysrc
xbindkeysrc --poll-rc

# Replace directories
\cp -r config/ ~/.config/
\cp -r scripts/ ~/scripts/
\cp -r programs/ ~/programs/

echo "\n########################################"
echo "#          All files replaced          #"
echo "########################################\n"

# Build dwm
cd ~/programs/dwm/
sudo make clean install

echo "\n#######################################"
echo "#              DWM built              #"
echo "#######################################\n"
