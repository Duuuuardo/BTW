#!/bin/bash

set -e

ascii_art='
  ____                  __        _       __    __
 / __ \____ ___  ____ _/ /____  _/ /_    / /_  / /__    __
/ / / / __ `__ \/ __ `/ //_/ / / / __ \ / __ \/ __/ | /| / /
/ /_/ / / / / / / /_/ / ,< / /_/ / /_/ // /_/ / /_ | |/ |/ /
\____/_/ /_/ /_/\__,_/_/|_|\__,_/_.___(_)_.___/\__/ |__/|__/

'

echo -e "$ascii_art"
echo "=> UBTW is for fresh Ubuntu GNOME installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

# Update system and install base dependencies
echo "=> Updating system and installing base dependencies..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git unzip

echo "Cloning UBTW..."
rm -rf ~/.local/share/btw
git clone --branch "${BTW_REF:-ubtw}" "${BTW_REPO:-https://github.com/Duuuuardo/btw.git}" ~/.local/share/btw >/dev/null

chmod +x ~/.local/share/btw/bin/btw

echo "Installation starting..."
source ~/.local/share/btw/install.sh
