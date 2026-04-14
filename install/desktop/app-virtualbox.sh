#!/bin/bash

# VirtualBox via Oracle's official apt repo
wget -O /tmp/oracle-vbox.asc https://www.virtualbox.org/download/oracle_vbox_2016.asc
sudo gpg --dearmor -o /usr/share/keyrings/oracle-virtualbox-2016.gpg /tmp/oracle-vbox.asc
rm /tmp/oracle-vbox.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $(. /etc/os-release && echo "$VERSION_CODENAME") contrib" \
  | sudo tee /etc/apt/sources.list.d/virtualbox.list >/dev/null
sudo apt update && sudo apt install -y virtualbox-7.1
sudo usermod -aG vboxusers ${USER}
