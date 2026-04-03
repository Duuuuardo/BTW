#!/bin/bash

sudo pacman -S --needed --noconfirm flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Force flatpak apps to respect the system GTK theme
sudo flatpak override --filesystem=xdg-config/gtk-3.0:ro
sudo flatpak override --filesystem=xdg-config/gtk-4.0:ro
