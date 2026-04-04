#!/bin/bash

# Install QEMU/KVM dependencies
# Note: ebtables is omitted because iptables-nft (Arch default) already provides ebtables compatibility
yay -S --needed --noconfirm qemu-full virt-manager virt-viewer dnsmasq bridge-utils libguestfs
sudo systemctl enable --now libvirtd.service
sudo usermod -aG libvirt $USER

echo "Downloading the VirtIO drivers to ~/Downloads"
mkdir -p ~/Downloads
curl -fsSL -o ~/Downloads/virtio-win-0.1.240.iso https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.240-1/virtio-win-0.1.240.iso

echo "Download the Windows 11 ISO from https://www.microsoft.com/software-download/windows11"
echo "Follow instructions at https://sysguides.com/install-a-windows-11-virtual-machine-on-kvm"
