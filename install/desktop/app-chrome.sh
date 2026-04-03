#!/bin/bash

# Browse the web with the most popular browser. See https://www.google.com/chrome/
yay -S --needed --noconfirm google-chrome
xdg-settings set default-web-browser google-chrome.desktop
