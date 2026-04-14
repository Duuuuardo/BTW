#!/bin/bash

# Display system information in the terminal
FASTFETCH_VERSION=$(curl -s https://api.github.com/repos/fastfetch-cli/fastfetch/releases/latest | grep -oP '"tag_name": "\K[^"]+')
wget -O /tmp/fastfetch.deb "https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb"
sudo apt install -y /tmp/fastfetch.deb
rm /tmp/fastfetch.deb

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use BTW fastfetch config
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/btw/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
