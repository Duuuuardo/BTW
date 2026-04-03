#!/bin/bash

cp ~/.local/share/btw/configs/alacritty/shared.toml ~/.config/alacritty/shared.toml
cp ~/.local/share/btw/configs/alacritty/pane.toml ~/.config/alacritty/pane.toml
cp ~/.local/share/btw/configs/alacritty/btop.toml ~/.config/alacritty/btop.toml
cp ~/.local/share/btw/configs/alacritty.toml ~/.config/alacritty/alacritty.toml

source $BTW_PATH/applications/About.sh
source $BTW_PATH/applications/Activity.sh
source $BTW_PATH/applications/Neovim.sh
source $BTW_PATH/applications/Docker.sh
source $BTW_PATH/applications/Btw.sh

alacritty migrate 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/pane.toml 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/btop.toml 2>/dev/null || true
