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
echo "=> BTW is for fresh Arch Linux GNOME installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

# Check for 'yay' and install it if not found
if ! command -v yay >/dev/null 2>&1; then
  echo "=> 'yay' not found. Installing 'yay'..."
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  pushd /tmp/yay >/dev/null
  makepkg -si --noconfirm
  popd >/dev/null
  rm -rf /tmp/yay
fi

# Update the system and 'yay'
echo "=> Updating system and 'yay' packages..."
yay -Syu --noconfirm

echo "Cloning BTW..."
rm -rf ~/.local/share/btw
git clone "${BTW_REPO:-https://github.com/Duuuuardo/btw.git}" ~/.local/share/btw >/dev/null
if [[ $BTW_REF != "master" ]]; then
	cd ~/.local/share/btw
	git fetch origin "${BTW_REF:-stable}" && git checkout "${BTW_REF:-stable}"
	cd -
fi

chmod +x ~/.local/share/btw/bin/btw

echo "Installation starting..."
source ~/.local/share/btw/install.sh
