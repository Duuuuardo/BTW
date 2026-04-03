#!/bin/bash

CHOICES=(
  "Zed               Fast all-purpose editor"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 8 --header "Install editor")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
  INSTALLER_FILE="$BTW_PATH/install/desktop/optional/app-$INSTALLER.sh"

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $BTW_PATH/bin/btw-sub/header.sh
source $BTW_PATH/bin/btw-sub/install.sh
