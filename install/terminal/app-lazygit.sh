#!/bin/bash

LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -oP '"tag_name": "v\K[^"]+')
curl -fsSL "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" | tar xz -C /tmp lazygit
sudo mv /tmp/lazygit /usr/local/bin/lazygit
mkdir -p ~/.config/lazygit/
touch ~/.config/lazygit/config.yml
