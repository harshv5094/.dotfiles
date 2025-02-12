#!/bin/sh -e

# Installing tmux package
package_manager=$(command -v pacman || true)
if [ -n "$package_manager" ]; then
  "${ESCALATION_TOOL}" "${package_manager}" -S --noconfirm tmux
fi

# Install tmux setup
if have tmux; then
  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    warning_msg "** Clonning Tmux Plugin Manager Repositroy **"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm/
  else
    warning_msg "** Tmux Plugin Manager already exist **"
  fi
else
  info_msg "** Exiting script, Please install tmux manually **"
  exit 1
fi
