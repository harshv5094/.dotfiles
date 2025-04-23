#!/bin/env sh

error_msg() {
  printf "\033[1;31m%b\033[0m\n" "$1"
}

# Check for sudo execution
if [ "$(id -u)" -eq 0 ]; then
  error_msg "Should not be ran as root !"
  exit 1
fi

warning_msg() {
  printf "\033[0;33m%b\033[0m\n" "$1"
}

info_msg() {
  printf "\033[0;36m%b\033[0m\n" "$1"
}

success_msg() {
  printf "\033[0;32m%b\033[0m\n" "$1"
}

# Command Existence Checker #
have() {
  command -v "$1" >/dev/null 2>&1
}

# Paru AUR Helper installer #
installParu() {
  info_msg "** Installing Paru **"
  "${ESCALATION_TOOL}" pacman -S --noconfirm --needed git base-devel
  git clone https://aur.archlinux.org/paru.git /tmp/paru && cd /tmp/paru && makepkg -si
  rm -rf /tmp/paru
}

# Systemd Service Starter #
systemdServices() {
  info_msg "** Enable Systemd Services **"

  # Helper function #
  enableService() {
    serviceName="$1"
    warning_msg "** Enabling ${serviceName} **"
    "$ESCALATION_TOOL" systemctl enable --now "${serviceName}.service"

    if systemctl is-active --quiet "${serviceName}.service"; then
      success_msg "** ${serviceName} is now active **"
    else
      error_msg "** Failed to activate ${serviceName} **"
    fi
  }

  # Loop through the services passed as arguments
  if [ "$#" -eq 0 ]; then
    error_msg "** No services provided **"
    return 1
  fi

  for service in "$@"; do
    enableService "$service"
  done
}

# Stow files function #
stowFiles() {
  if have stow; then
    # Remove if any of this file exist in the system
    file_paths=".bashrc .zshrc .gitconfig .czrc"

    for file in $file_paths; do
      if [ -e "${HOME}/${file}" ]; then
        warning_msg "*** ${HOME}/${file} exists ***"
        warning_msg "** Backing up existing ${file} directory **"
        mv "${HOME:?}/${file:?}" "${HOME:?}/${file:?}.bak"
      fi
    done

    # Remove all the config foler setup if present
    folder_paths="bat btop git ghostty fastfetch foot fish kitty lazydocker lazygit newsboat nvim tmux yazi"
    for folder in $folder_paths; do
      if [ -e "${CONFIG_DIR}/${folder}" ]; then
        warning_msg "*** ${CONFIG_DIR}/${folder} exists ***"
        warning_msg "** Backing up existing ${folder} directory **"
        mv "${CONFIG_DIR:?}/${folder:?}" "${CONFIG_DIR:?}/${folder:?}.bak"
      fi
    done

    # Stow my directories
    if [ -d "${DOTFILES_DIR}" ]; then
      warning_msg "** Stowing my files **"
      stow .
    fi

  else
    warning_msg "** Stow is not installed, Installing stow **"
    package_manager=$(command -v pacman || true)
    "${ESCALATION_TOOL}" "${package_manager}" -S --noconfirm stow
    stowFiles
  fi
}

hyprlandCheck() {
  printf "%b" "Do you want to install my Hyprland setup? (Y/N): "
  read -r choice
  case "$choice" in
  y | Y)
    info_msg "Starting hyprland script..."
    . ./.scripts/hyprland.sh
    ;;
  n | N)
    success_msg "Skipping Hyprland setup."
    ;;
  *)
    warning_msg "Invalid choice. Please enter Y or N."
    ;;
  esac
}

# Home Row Mods Setup #
homeRowModsCheck() {
  printf "%b" "Do you want to install my home row mods? (Y/N): "
  read -r choice
  case "$choice" in
  y | Y)
    info_msg "Downloading and running the home row mods setup script..."
    if curl -sL https://raw.githubusercontent.com/harshv5094/home-row-mods/refs/heads/main/linux.sh -o /tmp/home_row_mods.sh; then
      chmod +x /tmp/home_row_mods.sh
      /tmp/home_row_mods.sh
      rm /tmp/home_row_mods.sh
      rm -rf ~/home-row-mods/
    else
      warning_msg "Failed to download home row mods setup script!"
    fi
    ;;
  n | N)
    success_msg "Skipping home row mods setup."
    ;;
  *)
    warning_msg "Invalid choice. Please enter Y or N."
    ;;
  esac
}

# Wallpaper clone function #
cloneWallpapers() {
  if [ -e "$HOME/Pictures/wallpapers/" ]; then
    info_msg "** Clonning My wallpapers **"
    git clone https://github.com/harshv5094/wallpapers "$HOME/Pictures/wallpapers/"
  else
    mkdir -p "$HOME/Pictures/wallpapers/"
    info_msg "** Clonning My wallpapers **"
    git clone https://github.com/harshv5094/wallpapers "$HOME/Pictures/wallpapers/"
  fi

}

# Main Menu #
prompt() {
  info_msg "\n** Welcome to my setup installation script **"
  info_msg "1. Stow My files"
  info_msg "2. Fish Shell Setup"
  info_msg "3. Tmux Setup"
  info_msg "4. My Hyprland Configuration"
  info_msg "5. Home Row Mods Configuration"
  info_msg "6. Clone My Wallpapers"
  info_msg "0. Exit"
  printf "%b" "Choose the option [0-6]: "
  read -r choice
}

# Gloabl Variables #
DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="$HOME/.config"
ESCALATION_TOOL=$(command -v doas || command -v sudo || error_msg "No escalation tool found")

if [ ! -d "${CONFIG_DIR}" ]; then
  mkdir -p "${CONFIG_DIR}"
fi

if [ ! -d "${DOTFILES_DIR}" ]; then
  info_msg "Cloning my dotfiles repository..."
  git clone https://github.com/harshv5094/.dotfiles "${DOTFILES_DIR}"
  cd "${DOTFILES_DIR}"
  success_msg "DOTFILES_DIR: $(pwd)"
  prompt
else
  cd "${DOTFILES_DIR}"
  success_msg "DOTFILES_DIR: $(pwd)"
  prompt
fi

while [ "$choice" != "0" ]; do
  case "$choice" in
  1)
    stowFiles
    ;;
  2)
    . ./.scripts/fish.sh
    ;;
  3)
    . ./.scripts/tmux.sh
    ;;
  4)
    hyprlandCheck
    ;;
  5)
    homeRowModsCheck
    ;;
  6)
    cloneWallpapers
    ;;
  *)
    error_msg "Invalid choice. Please enter a valid option !!"
    ;;
  esac
  prompt
done
