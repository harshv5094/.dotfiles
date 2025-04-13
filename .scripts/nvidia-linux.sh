#!/bin/env sh

ESCALATION_TOOL=$(command -v doas || command -v sudo || error_msg "No escalation tool found")

if command -v pacman >/dev/null; then
  # Installing my nvidia drivers
  printf "%s" "** Installing Nvidia Drivers **"
  "$ESCALATION_TOOL" pacman -S nvidia-dkms nvidia-utils egl-wayland opencl-nvidia nvidia-settings linux-headers linux-lts-headers xorg

  # Enable Systemd Services
  sudo systemctl enable nvidia-hibernate nvidia-powerd nvidia-persistenced nvidia-resume nvidia-suspend

  printf "%s" "** Creating Initial Ramdisk Environment **"
  mkinitcpio
fi
