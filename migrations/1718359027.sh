#!/bin/bash

# Catch 1.0.0 up to 1.1.0

sudo echo "Running upgrade migration..."

# Change Zellij directory to be realized rather than a symlink
ZELLIJ_THEMES_DIR="$HOME/.config/zellij/themes"
if [ -L $ZELLIJ_THEMES_DIR ]; then
	rm $ZELLIJ_THEMES_DIR
	mkdir -p $ZELLIJ_THEMES_DIR
	for dir in $BTW_PATH/themes/*; do
		if [ -d "$dir" ]; then
			zellij_file="$dir/zellij.kdl"
			dir_name=$(basename "$dir")
			dest_file="$ZELLIJ_THEMES_DIR/$dir_name.kdl"
			cp "$zellij_file" "$dest_file"
		fi
	done
fi

# New neovim settings
mkdir -p ~/.config/nvim/plugin/after
cp $BTW_PATH/configs/neovim/transparency.lua ~/.config/nvim/plugin/after/
sed -i 's/checker = { enabled = true }/checker = { enabled = true, notify = false }/g' ~/.config/nvim/lua/config/lazy.lua
source ~/.local/share/btw/applications/Neovim.sh

# New font size setup
cp $BTW_PATH/configs/alacritty/font-size.toml ~/.config/alacritty/
cp ~/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml.bak
cp $BTW_PATH/configs/alacritty.toml ~/.config/alacritty/alacritty.toml
source $BTW_PATH/install/desktop/set-framework-text-scaling.sh

cp $BTW_PATH/themes/gruvbox/alacritty.toml ~/.config/alacritty/theme.toml
cp $BTW_PATH/configs/alacritty/fonts/CaskaydiaMono.toml ~/.config/alacritty/font.toml

# Set new Gnome settings
source $BTW_PATH/install/desktop/set-gnome-settings.sh

# Install new apps
source $BTW_PATH/install/desktop/a-flatpak.sh
source $BTW_PATH/install/desktop/app-gnome-sushi.sh
source $BTW_PATH/install/desktop/app-localsend.sh
source $BTW_PATH/install/desktop/app-obsidian.sh
source $BTW_PATH/install/terminal/app-fastfetch.sh
source $BTW_PATH/install/terminal/apps-terminal.sh

# Add new desktop applications icons
source $BTW_PATH/applications/Btw.sh
source $BTW_PATH/applications/About.sh
source $BTW_PATH/applications/Activity.sh
source $BTW_PATH/applications/Docker.sh

# Update icons of apps still installed
[ -f ~/.local/share/applications/WhatsApp.desktop ] && source $BTW_PATH/applications/WhatsApp.sh

# Set new app grid
source $BTW_PATH/install/desktop/set-app-grid.sh

# Add new Gnome extensions
source $BTW_PATH/install/desktop/set-gnome-extensions.sh

gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align left --width 80 --margin "1 2" --padding "2 4" \
	"1. alacritty.toml config moved to .bak to include new font-size.toml" \
	"2. Alacritty theme/font has been reset. Use btw app to set again." \
	"3. To use Pano, the new clipboard manager, enable in Gnome Extensions."

gum confirm "Set your application dock to default with new apps?" && source $BTW_PATH/install/desktop/set-dock.sh
gum confirm "Ready to logout for all settings to take effect?" && gnome-session-quit --logout --no-prompt
