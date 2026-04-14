#!/bin/bash

wget -O /tmp/vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install -y /tmp/vscode.deb
rm /tmp/vscode.deb

mkdir -p ~/.config/Code/User
cp ~/.local/share/btw/configs/vscode.json ~/.config/Code/User/settings.json

# Install Gruvbox Material theme
code --install-extension sainnhe.gruvbox-material
