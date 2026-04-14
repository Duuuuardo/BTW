#!/bin/bash

# Needed for all installers
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git unzip software-properties-common

# Run terminal installers
for installer in ~/.local/share/btw/install/terminal/*.sh; do source $installer; done

echo "Finished installing all Terminal-based apps and configurations. Log out and log back in."
