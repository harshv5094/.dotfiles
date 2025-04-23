#!/bin/env sh

# Fish Shell Setup
info_msg "** Install fish shell and required cli tools"
package_manager=$(command -v pacman || true)
if [ -n "${package_manager}" ]; then
  "${ESCALATION_TOOL}" "${package_manager}" -S --needed --noconfirm fish flatpak tree git github-cli git-lfs git-filter-repo \
    wget curl zip unzip peco ripgrep fzf sox bat eza lazygit btop fd \
    zoxide yt-dlp xsel fastfetch openssh tldr yazi \
    trash-cli usbutils cronie imagemagick man-db vdpauinfo \
    starship bash-completion neovim newsboat go rust base-devel make cmake ninja luarocks
fi

if have fish; then
  info_msg "** Setting Up Fish Shell **"
  ~/.dotfiles/.scripts/fish-shell-setup.fish

else
  info_msg "** Exiting script, Please install fish shell manually **"
  exit 1
fi
