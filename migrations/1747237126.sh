#!/bin/bash

cp ~/.local/share/btw/configs/alacritty/btop.toml ~/.config/alacritty/btop.toml

# Only attempt to set configuration if btop is not already set
if [ ! -f "$HOME/.config/btop/btop.conf" ]; then
  # Use BTW btop config
  mkdir -p ~/.config/btop/themes
  cp ~/.local/share/btw/configs/btop.conf ~/.config/btop/btop.conf
fi

# Set the Gruvbox theme for btop
if [ -f "$BTW_PATH/themes/gruvbox/btop.theme" ]; then
  cp $BTW_PATH/themes/gruvbox/btop.theme ~/.config/btop/themes/gruvbox.theme
  sed -i "s/color_theme = \".*\"/color_theme = \"gruvbox\"/g" ~/.config/btop/btop.conf
fi

