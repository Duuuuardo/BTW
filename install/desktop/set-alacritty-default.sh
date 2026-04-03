#!/usr/bin/env sh

# Make alacritty default terminal emulator
# On Arch, gsettings is used instead of update-alternatives
if command -v gsettings &> /dev/null; then
  gsettings set org.gnome.desktop.default-applications.terminal exec 'alacritty'
fi