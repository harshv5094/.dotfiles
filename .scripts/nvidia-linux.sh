#!/bin/sh -e

if have pacman; then
  # Installing my nvidia drivers
  info_msg "** Installing Nvidia Drivers **"
  "$ESCALATION_TOOL" pacman -S nvidia-dkms nvidia-utils egl-wayland opencl-nvidia nvidia-settings linux-headers linux-lts-headers xorg

  # Enable Systemd Services
  systemdServices nvidia-hibernate nvidia-powerd nvidia-persistenced nvidia-resume nvidia-suspend

  info_msg "** Creating Initial Ramdisk Environment **"
  mkinitcpio
fi
