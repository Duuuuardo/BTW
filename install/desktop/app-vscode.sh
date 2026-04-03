#!/bin/bash

yay -S --needed --noconfirm visual-studio-code-bin

mkdir -p ~/.config/Code/User
cp ~/.local/share/btw/configs/vscode.json ~/.config/Code/User/settings.json

# Install Gruvbox Material theme
code --install-extension sainnhe.gruvbox-material