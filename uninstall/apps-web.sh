#!/bin/bash

for app in WhatsApp ChatGPT YouTube "YouTube Music" GitHub "Google Photos" "Google Messages" "Google Maps" Figma X; do
  rm -f "$HOME/.local/share/applications/${app}.desktop"
  rm -f "$HOME/.local/share/applications/icons/${app}.png"
done
