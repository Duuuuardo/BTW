#!/bin/bash

yay -S --needed --noconfirm tailscale
sudo systemctl enable --now tailscaled
