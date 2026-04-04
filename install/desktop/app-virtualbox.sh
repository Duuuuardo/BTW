#!/bin/bash

# Virtualbox allows you to run VMs for other flavors of Linux or even Windows
yay -S --needed --noconfirm virtualbox virtualbox-ext-oracle
sudo usermod -aG vboxusers ${USER}
