#!/bin/bash

# Browse the web with the most popular browser. See https://www.google.com/chrome/
wget -O /tmp/chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo apt install -y /tmp/chrome.deb
rm /tmp/chrome.deb
xdg-settings set default-web-browser google-chrome.desktop
