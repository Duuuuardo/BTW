#!/bin/bash

# Needed for all installers
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm curl git unzip

# Run terminal installers
for installer in ~/.local/share/btw/install/terminal/*.sh; do source $installer; done

echo "Finished installing all Terminal-based apps and configurations. Log out and log back in."
