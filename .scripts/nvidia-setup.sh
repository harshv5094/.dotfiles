#!/bin/sh -e

. "$HOME/.dotfiles/.scripts/common-script.sh"

if command_exists pacman; then
  # Installing nvidia drivers
  sudo pacman -S nvidia-dkms nvidia-utils egl-wayland opencl-nvidia nvidia-settings linux-headers linux-lts-headers
  sudo systemctl enable --now nvidia-hibernate.service nvidia-persistenced.service nvidia-powerd.service nvidia-resume.service nvidia-suspend.service
  mkinitcpio
fi
