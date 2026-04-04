#!/bin/bash

# Enable multilib repo (needed for 32-bit Steam dependencies)
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
  sudo sed -i '/^#\[multilib\]/{s/^#//;n;s/^#//}' /etc/pacman.conf
  sudo pacman -Sy --noconfirm
fi

# Play games from https://store.steampowered.com/
yay -S --needed --noconfirm steam
