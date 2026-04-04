#!/bin/bash

CHOICES=(
  "Dev Editor        Install alternative programming editors"
  "Dev Language      Install programming language environment"
  "Dev Database      Install development database in Docker"
  "Tailscale         Mesh VPN based on WireGuard and with Magic DNS"
  "Web Apps          Install web apps with their own icon and shell"
  "Windows           Install Windows VM via Docker (auto download + RDP)"
  "> All             Re-run any of the default installers"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 10 --header "Install application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
  INSTALLER_FILE=$(gum file $BTW_PATH/install)

  [[ -n "$INSTALLER_FILE" ]] &&
    gum confirm "Run installer?" &&
    source $INSTALLER_FILE &&
    gum spin --spinner globe --title "Install completed!" -- sleep 3
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$INSTALLER" in
  "dev-editor") INSTALLER_FILE="$BTW_PATH/bin/btw-sub/install-dev-editor.sh" ;;
  "web-apps") INSTALLER_FILE="$BTW_PATH/install/desktop/select-web-apps.sh" ;;
  "dev-language") INSTALLER_FILE="$BTW_PATH/install/terminal/select-dev-language.sh" ;;
  "dev-database") INSTALLER_FILE="$BTW_PATH/install/terminal/select-dev-storage.sh" ;;
  "tailscale") INSTALLER_FILE="$BTW_PATH/install/terminal/app-tailscale.sh" ;;
  "windows") INSTALLER_FILE="$BTW_PATH/install/desktop/app-windows.sh" ;;
  *) INSTALLER_FILE="$BTW_PATH/install/desktop/app-$INSTALLER.sh" ;;
  esac

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $BTW_PATH/bin/btw
