#!/bin/bash

ZELLIJ_VERSION=$(curl -s https://api.github.com/repos/zellij-org/zellij/releases/latest | grep -oP '"tag_name": "v\K[^"]+')
curl -fsSL "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz" | tar xz -C /tmp zellij
sudo mv /tmp/zellij /usr/local/bin/zellij

mkdir -p ~/.config/zellij/themes
[ ! -f "$HOME/.config/zellij/config.kdl" ] && cp ~/.local/share/btw/configs/zellij.kdl ~/.config/zellij/config.kdl
cp ~/.local/share/btw/themes/gruvbox/zellij.kdl ~/.config/zellij/themes/gruvbox.kdl
