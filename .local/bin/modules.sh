#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)

# Print success or failure message for commands
function cmdCheck() {
  if [ $? -eq 0 ]; then
    printf "%b\n" "${GREEN}SUCCESS${RESET}"
  else
    printf "%b\n" "${RED}FAILED${RESET}"
  fi
}

# Check if a command exists
function have() {
  command -v "$1" >/dev/null 2>&1
}

# Install Paru (AUR Helper) if not installed
function installParu() {
  printf "%b\n" "${CYAN}** Installing Paru **${RESET}"
  sudo pacman -S --noconfirm --needed git base-devel
  git clone https://aur.archlinux.org/paru.git /tmp/paru && cd /tmp/paru && makepkg -si
  rm -rf /tmp/paru
}

function installPackage() {

  # Check and install using the available package manager
  if command_exists pacman; then
    sudo pacman -S --noconfirm "$1"
  elif command_exists dnf; then
    sudo dnf install -y "$1"
  elif command_exists apt; then
    sudo apt install -y "$1"
  elif command_exists zypper; then
    sudo zypper install -y "$1"
  elif command_exists brew; then
    brew install "$1"
  else
    printf "%b\n" "${RED}** Your distro or package manager is not supported by this function **${RESET}"
  fi
}

# A function for enable systemd services
function systemdServices() {
  printf "%b\n" "${CYAN}** Enable Systemd Services **${RESET}"

  # Helper function to enable a service
  function enableService() {
    local serviceName="$1"
    printf "%b\n" "${YELLOW}** Enabling ${serviceName} **${RESET}"
    sudo systemctl enable --now "${serviceName}.service"

    if systemctl is-active --quiet "${serviceName}.service"; then
      printf "%b\n" "${GREEN}** ${serviceName} is now active **${RESET}"
    else
      printf "%b\n" "${RED}** Failed to activate ${serviceName} **${RESET}"
    fi
  }

  # Loop through the services passed as arguments
  if [ "$#" -eq 0 ]; then
    printf "%b\n" "${RED}** No services provided **${RESET}"
    return 1
  fi

  for service in "$@"; do
    enableService "$service"
  done
}

function extras-setup() {
  # Setting Up Tmux
  function tmux-setup() {
    if have tmux; then
      if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        printf "%b\n" "${YELLOW} Clonning Tmux Plugin Manager Repositroy ${RESET}"
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm/
      else
        printf "%b\n" "${YELLOW} Tmux Plugin Manager already exist${RESET}"
      fi
    else
      installPackage tmux
      tmux-setup
    fi
  }
  tmux-setup

  # Setting Up fish shell
  function fish-setup() {
    if have fish; then
      printf "%b\n" "${CYAN}** Setting Up Fish Shell **${RESET}"
      ~/.dotfiles/.scripts/fish-shell-setup.fish
      ~/.dotfiles/.scripts/nvm-fish-setup.fish
    else
      printf "%b\n" "${RED}** Install Fish Shell first **${RESET}"
      installPackage fish
      fish-setup
    fi
  }
  fish-setup

  # Setting up my gitconfig
  printf "%b\n" "${CYAN}** Adding my gitconfig **${RESET}"
  if [ -f "$HOME/.gitconfig" ]; then
    cp "$HOME/.dotfiles/extras/.gitconfig" "$HOME"
  fi
  cmdCheck

}
