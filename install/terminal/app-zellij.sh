#!/bin/bash

yay -S --needed --noconfirm zellij

mkdir -p ~/.config/zellij/themes
[ ! -f "$HOME/.config/zellij/config.kdl" ] && cp ~/.local/share/btw/configs/zellij.kdl ~/.config/zellij/config.kdl
cp ~/.local/share/btw/themes/gruvbox/zellij.kdl ~/.config/zellij/themes/gruvbox.kdl
