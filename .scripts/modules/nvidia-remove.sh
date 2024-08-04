#!/usr/bin/env bash

if command -v dnf &>/dev/null; then
  sudo dnf remove akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda
  sudo rm -f /usr/lib{,64}/libGL.so.* /usr/lib{,64}/libEGL.so.*
  sudo rm -f /usr/lib{,64}/xorg/modules/extensions/libglx.so
  sudo dnf reinstall xorg-x11-server-Xorg mesa-libGL mesa-libEGL libglvnd\*
  have /etc/X11/xorg.conf || sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.saved
fi
