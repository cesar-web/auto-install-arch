#!bin/sh

echo "Replacing files"

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

echo ""
echo "########################################"
echo "#          All files replaced          #"
echo "########################################"
echo ""
