#!/bin/bash

source $BTW_PATH/defaults/bash/functions

AVAILABLE_WEB_APPS=("WhatsApp" "ChatGPT" "YouTube" "YouTube Music" "GitHub" "Google Photos" "Google Messages" "Google Maps" "Figma" "X")
apps=$(gum choose "${AVAILABLE_WEB_APPS[@]}" --no-limit --height 12 --header "Select web apps to uninstall")

if [[ -n "$apps" ]]; then
  IFS=$'\n'
  for app in $apps; do
    web2app-remove "$app"
    app2folder-remove "${app}.desktop" WebApps
  done
fi
