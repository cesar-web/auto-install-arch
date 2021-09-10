#!bin/sh

sudo echo ""

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

echo ""
echo "########################################"
echo "#          All files replaced          #"
echo "########################################"
echo ""

# Build dwm
cd /home/cesar/programs/dwm/
sudo make clean install

echo ""
echo "########################################"
echo "#             DWM compiled             #"
echo "########################################"
echo ""
