#!/usr/bin/env bash

# Install packages for arch based distro
package_manager=$(command -v pacman || true)
if [ -n "${package_manager}" ]; then
  "${ESCALATION_TOOL}" "${package_manager}" -S --noconfirm emacs
fi

# Clonning Doom Emacs installation directory
if [ -e "${CONFIG_DIR}/emacs" ]; then
  info_msg "** Backing up your emacs config directory **"
  mv "${CONFIG_DIR}/emacs" "${CONFIG_DIR}/emacs.bak"

  info_msg "** Clonning doom emacs setup directory **"
  git clone --depth 1 https://github.com/doomemacs/doomemacs "${CONFIG_DIR}/emacs"
else
  info_msg "** Clonning doom emacs setup directory **"
  git clone --depth 1 https://github.com/doomemacs/doomemacs "${CONFIG_DIR}/emacs"
fi

# Clonning my doom emacs config directory
if [ ! -d "${CONFIG_DIR}/doom" ]; then
  info_msg "** Clonning my doom config directory **"
  git clone https://github.com/harshv5094/doom "${CONFIG_DIR}/doom"
else
  info_msg "** Backing up your doom config directory **"
  mv "${CONFIG_DIR}/doom" "${CONFIG_DIR}/doom.bak"

  info_msg "** Clonning my doom config directory **"
  git clone https://github.com/harshv5094/doom "${CONFIG_DIR}/doom"
fi

# Starting doom emacs installation
if [ -f "${CONFIG_DIR}/emacs/bin/doom" ]; then
  "${CONFIG_DIR}/emacs/bin/doom" install
  "${CONFIG_DIR}/emacs/bin/doom" sync
  success_msg "** Doom emacs Installation is finished **"
fi
