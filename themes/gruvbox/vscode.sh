#!/bin/bash

if command -v code &>/dev/null; then
  code --install-extension sainnhe.gruvbox-material >/dev/null
  sed -i 's/"workbench.colorTheme": ".*"/"workbench.colorTheme": "Gruvbox Material Dark"/g' ~/.config/Code/User/settings.json
fi
