#!/bin/bash

cat <<EOF >~/.local/share/applications/Btw.desktop
[Desktop Entry]
Version=1.0
Name=BTW
Comment=BTW Controls
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=BTW --title=BTW -e btw
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/btw/applications/icons/Btw.png
Categories=GTK;
StartupNotify=false
EOF
