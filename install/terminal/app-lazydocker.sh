#!/bin/bash

# Arch may already have fakeroot-tcp
if ! $(pacman -Qi fakeroot-tcp &>/dev/null); then
  sudo pacman -S --needed --noconfirm fakeroot
fi

yay -S --needed --noconfirm lazydocker-bin
