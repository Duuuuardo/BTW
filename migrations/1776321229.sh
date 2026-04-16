#!/bin/bash

# Allow extensions regardless of GNOME version
gsettings set org.gnome.shell disable-extension-version-validation true

# Uninstall Vitals
if [ -n "$(gnome-extensions list | grep Vitals@CoreCoding.com)" ]; then
  gnome-extensions uninstall Vitals@CoreCoding.com
fi

# Uninstall workspaces-bar
if [ -n "$(gnome-extensions list | grep workspaces-bar@fthx)" ]; then
  gnome-extensions uninstall workspaces-bar@fthx
fi

# Install space-bar and TopHat
gext install space-bar@luchrioh
gext install tophat@fflewddur.github.io

sudo cp ~/.local/share/gnome-shell/extensions/space-bar\@luchrioh/schemas/org.gnome.shell.extensions.space-bar.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/tophat\@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Space Bar
gsettings set org.gnome.shell.extensions.space-bar.behavior smart-workspace-names false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-activate-workspace-shortcuts false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts true
gsettings set org.gnome.shell.extensions.space-bar.shortcuts open-menu "@as []"

# Configure TopHat
gsettings set org.gnome.shell.extensions.tophat show-icons false
gsettings set org.gnome.shell.extensions.tophat show-cpu false
gsettings set org.gnome.shell.extensions.tophat show-disk false
gsettings set org.gnome.shell.extensions.tophat show-mem false
gsettings set org.gnome.shell.extensions.tophat network-usage-unit bits

# Set TopHat metrics color to match the Gruvbox theme
source $BTW_PATH/themes/gruvbox/tophat.sh

# Logout
gum confirm "Ready to logout for all settings to take effect?" && gnome-session-quit --logout --no-prompt
