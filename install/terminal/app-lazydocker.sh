#!/bin/bash

LAZYDOCKER_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazydocker/releases/latest | grep -oP '"tag_name": "v\K[^"]+')
curl -fsSL "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz" | tar xz -C /tmp lazydocker
sudo mv /tmp/lazydocker /usr/local/bin/lazydocker
