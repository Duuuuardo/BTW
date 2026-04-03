#!/bin/bash

# This script installs btop, a resource monitor that shows usage and stats for processor, memory, disks, network and processes.
yay -S --needed --noconfirm btop

# Use BTW btop config
mkdir -p ~/.config/btop/themes
cp ~/.local/share/btw/configs/btop.conf ~/.config/btop/btop.conf
cp ~/.local/share/btw/themes/gruvbox/btop.theme ~/.config/btop/themes/gruvbox.theme

