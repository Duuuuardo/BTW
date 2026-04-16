#!/bin/bash

# Use system Python (not mise's) to avoid missing build module during AUR compilation
PATH=$(echo "$PATH" | tr ':' '\n' | grep -v mise | tr '\n' ':') yay -S --needed --noconfirm python-build gnome-shell-extension-manager gnome-extensions-cli

# Turn off default GNOME extensions (if present)
gnome-extensions disable tiling-assistant@ubuntu.com 2>/dev/null || true
gnome-extensions disable ubuntu-appindicators@ubuntu.com 2>/dev/null || true
gnome-extensions disable ubuntu-dock@ubuntu.com 2>/dev/null || true
gnome-extensions disable ding@rastersoft.com 2>/dev/null || true

# Pause to assure user is ready to accept confirmations
gum confirm "To install Gnome extensions, you need to accept some confirmations. Ready?"

# Install new extensions
gext install tactile@lundal.io
gext install just-perfection-desktop@just-perfection
gext install blur-my-shell@aunetx
gext install workspaces-bar@fthx                  # replaces space-bar (GNOME 47+ compatible)
gext install vitals@CoreCoding.com                # replaces tophat (GNOME 47+ compatible)
gext install AlphabeticalAppGrid@stuarthayhurst

# Compile gsettings schemas in order to be able to set them
sudo cp ~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop\@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell\@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/workspaces-bar\@fthx/schemas/org.gnome.shell.extensions.workspaces-bar.gschema.xml /usr/share/glib-2.0/schemas/ 2>/dev/null || true
sudo cp ~/.local/share/gnome-shell/extensions/vitals\@CoreCoding.com/schemas/org.gnome.shell.extensions.vitals.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/AlphabeticalAppGrid\@stuarthayhurst/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Tactile
gsettings set org.gnome.shell.extensions.tactile col-0 1
gsettings set org.gnome.shell.extensions.tactile col-1 2
gsettings set org.gnome.shell.extensions.tactile col-2 1
gsettings set org.gnome.shell.extensions.tactile col-3 0
gsettings set org.gnome.shell.extensions.tactile row-0 1
gsettings set org.gnome.shell.extensions.tactile row-1 1
gsettings set org.gnome.shell.extensions.tactile gap-size 32

# Configure Just Perfection
gsettings set org.gnome.shell.extensions.just-perfection animation 2
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
gsettings set org.gnome.shell.extensions.just-perfection workspace true
gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false

# Configure Blur My Shell
gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.overview blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'

# Configure Vitals (system monitor)
gsettings set org.gnome.shell.extensions.vitals hot-sensors "['__network-rx_max__', '__network-tx_max__', '_memory_usage_']"
gsettings set org.gnome.shell.extensions.vitals show-storage false
gsettings set org.gnome.shell.extensions.vitals show-temperature false
gsettings set org.gnome.shell.extensions.vitals show-voltage false
gsettings set org.gnome.shell.extensions.vitals show-fan false
gsettings set org.gnome.shell.extensions.vitals show-memory true
gsettings set org.gnome.shell.extensions.vitals show-processor true
gsettings set org.gnome.shell.extensions.vitals show-network true
gsettings set org.gnome.shell.extensions.vitals use-higher-precision false
gsettings set org.gnome.shell.extensions.vitals position-in-panel 0

# Configure AlphabeticalAppGrid
gsettings set org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'end'
