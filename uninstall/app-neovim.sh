#!/bin/bash

sudo apt remove --purge -y neovim luarocks
mise exec -- npm uninstall -g tree-sitter-cli
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
