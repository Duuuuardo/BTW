#!/bin/bash

# Install Neovim (latest stable via PPA), luarocks, tree-sitter, dotnet, and omnisharp
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update && sudo apt install -y neovim luarocks

# tree-sitter-cli via npm (requires mise node to be installed)
mise exec -- npm install -g tree-sitter-cli

# dotnet via Microsoft's install script
curl -fsSL https://dot.net/v1/dotnet-install.sh | bash -s -- --channel LTS --install-dir ~/.dotnet
export PATH="$PATH:$HOME/.dotnet"
echo 'export PATH="$PATH:$HOME/.dotnet"' >> ~/.local/share/btw/defaults/zsh/shell

# Only attempt to set configuration if Neovim has never been run
if [ ! -d "$HOME/.config/nvim" ]; then
  # Copy Duuuuardo's LazyVim config (based on craftzdog/dotfiles-public)
  mkdir -p ~/.config/nvim/lua/config
  mkdir -p ~/.config/nvim/lua/duuuuardo
  mkdir -p ~/.config/nvim/lua/plugins

  # Core config
  cp ~/.local/share/btw/configs/neovim/init.lua ~/.config/nvim/init.lua
  cp ~/.local/share/btw/configs/neovim/config/lazy.lua ~/.config/nvim/lua/config/lazy.lua
  cp ~/.local/share/btw/configs/neovim/config/options.lua ~/.config/nvim/lua/config/options.lua
  cp ~/.local/share/btw/configs/neovim/config/keymaps.lua ~/.config/nvim/lua/config/keymaps.lua

  # Duuuuardo utilities (renamed from craftzdog)
  cp ~/.local/share/btw/configs/neovim/duuuuardo/calmdown.lua ~/.config/nvim/lua/duuuuardo/calmdown.lua
  cp ~/.local/share/btw/configs/neovim/duuuuardo/lsp.lua ~/.config/nvim/lua/duuuuardo/lsp.lua

  # Plugin configs
  cp ~/.local/share/btw/configs/neovim/plugins/colorscheme.lua ~/.config/nvim/lua/plugins/colorscheme.lua
  cp ~/.local/share/btw/configs/neovim/plugins/coding.lua ~/.config/nvim/lua/plugins/coding.lua
  cp ~/.local/share/btw/configs/neovim/plugins/editor.lua ~/.config/nvim/lua/plugins/editor.lua
  cp ~/.local/share/btw/configs/neovim/plugins/lsp.lua ~/.config/nvim/lua/plugins/lsp.lua
  cp ~/.local/share/btw/configs/neovim/plugins/treesitter.lua ~/.config/nvim/lua/plugins/treesitter.lua
  cp ~/.local/share/btw/configs/neovim/plugins/ui.lua ~/.config/nvim/lua/plugins/ui.lua

  # Make everything match the terminal transparency
  mkdir -p ~/.config/nvim/plugin/after
  cp ~/.local/share/btw/configs/neovim/transparency.lua ~/.config/nvim/plugin/after/

  # Turn off animated scrolling
  cp ~/.local/share/btw/configs/neovim/snacks-animated-scrolling-off.lua ~/.config/nvim/lua/plugins/
fi

# Replace desktop launcher with one running inside Alacritty
if [[ -d ~/.local/share/applications ]]; then
  sudo rm -rf /usr/share/applications/nvim.desktop
  source ~/.local/share/btw/applications/Neovim.sh
fi
