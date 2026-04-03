#!/bin/bash

# Install QEMU/KVM dependencies
yay -S --needed --noconfirm qemu-full virt-manager virt-viewer dnsmasq bridge-utils libguestfs ebtables
sudo systemctl enable --now libvirtd.service
sudo usermod -aG libvirt $USER

echo "Downloading the VirtIO drivers to ~/Downloads"
mkdir -p ~/Downloads
curl -fsSL -o ~/Downloads/virtio-win-0.1.240.iso https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.240-1/virtio-win-0.1.240.iso

echo "Download the Windows 11 ISO..."
xdg-open https://www.microsoft.com/software-download/windows11
gum confirm "Have you finished downloading?"

echo "Follow instructions in..."
xdg-open https://sysguides.com/install-a-windows-11-virtual-machine-on-kvm
