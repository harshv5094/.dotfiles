#!/usr/bin/env bash

if command -v dnf &>/dev/null; then
  sudo dnf install akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda
fi
