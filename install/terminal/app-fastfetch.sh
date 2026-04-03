#!/bin/bash

# Display system information in the terminal
yay -S --needed --noconfirm fastfetch

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use BTW fastfetch config
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/btw/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
