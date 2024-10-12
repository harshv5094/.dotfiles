#!/bin/sh -e

. "$HOME/.dotfiles/.scripts/common-script.sh"
# This script allows user to download proprietary drivers for nvidia in fedora

# It also disables noveau nvidia drivers

# Installation guide link: https://rpmfusion.org/Howto/NVIDIA

# NOTE: Currently script only provides drivers for gpu 2014 and above (510+ and above)

checkRepo() {
  REPO_ID="rpmfusion-nonfree-nvidia-driver"

  if [ "$(dnf repolist enabled 2>/dev/null | grep -c "$REPO_ID")" -gt 0 ]; then
    printf "%b\n" "${GREEN}Nvidia non-free repository is already enabled.${RC}"
  else
    printf "%b\n" "${YELLOW}Nvidia non-free repository is not enabled. Enabling now...${RC}"

    # Enable the repository
    "$ESCALATION_TOOL" dnf config-manager --set-enabled "$REPO_ID"

    # Refreshing repository list
    "$ESCALATION_TOOL" dnf makecache

    # Verify if the repository is enabled
    if [ "$(dnf repolist enabled 2>/dev/null | grep -c "$REPO_ID")" -gt 0 ]; then
      printf "%b\n" "${GREEN}Nvidia non-free repository is now enabled...${RC}"
    else
      printf "%b\n" "${RED}Failed to enable nvidia non-free repository...${RC}"
      exit 1
    fi
  fi
}

checkDriverInstallation() {
  if modinfo -F version nvidia >/dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}

installDriver() {

  if checkDriverInstallation; then
    printf "%b\n" "${GREEN}NVIDIA driver is already installed.${RC}"
    exit 0
  fi

  # NOTE:: Installing graphics driver.
  printf "%b\n" "${YELLOW} Installing Nvidia Driver ${RC}"
  "$ESCALATION_TOOL" "$PACKAGER" install akmod-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia

  for i in $(seq 1 5); do
    if checkDriverInstallation; then
      printf "%b\n" "${GREEN}Driver installed successfully.${RC}"
      printf "%b\n" "${GREEN}Installed driver version $(modinfo -F version nvidia)${RC}"
      break
    fi
    printf "%b\n" "${YELLOW}Waiting for driver to be built..."
    sleep 1m
  done

  printf "%b\n" "${GREEN}Now you can reboot the system.${RC}"

}

removeDriver() {
  if checkDriverInstallation; then
    printf "%b\n" "${CYAN}Removing Nvidia Driver${RC}"
    "$ESCALATION_TOOL" "$PACKAGER" remove akmod-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia
    "$ESCALATION_TOOL" rm -f /usr/lib{,64}/libGL.so.* /usr/lib{,64}/libEGL.so.*
    "$ESCALATION_TOOL" rm -f /usr/lib{,64}/xorg/modules/extensions/libglx.so
    "$ESCALATION_TOOL" "$PACKAGER" reinstall xorg-x11-server-Xorg mesa-libGL mesa-libEGL libglvnd\*
  else
    printf "%b\n" "${GREEN}NVIDIA driver is not installed.${RC}"
  fi

  if [ -e /etc/X11/xorg.conf ]; then
    mv /etc/X11/xorg.conf /etc/X11/xorg.conf.saved
  fi
}

driverMenu() {
  printf "%b\n" "${CYAN}Welcome to NVIDIA Drives Installation Setup${RC}"
  printf "%b\n" "${YELLOW} 1. Install\n 2. Remove\n q. Exit${RC}"
  printf "%b" "${CYAN}Enter Choice: ${RC}"
  read -r choice
  case "$choice" in
  1)
    checkRepo
    installDriver
    return
    ;;
  2)
    removeDriver
    return
    ;;
  q | Q)
    return
    ;;
  esac
}

# NOTE: A confirmation option to proceed or not
userConfirmation() {
  printf "%b" "${YELLOW}Do you want to continue? (y/N): ${RC}"
  read -r choice
  case "$choice" in
  y | Y)
    checkRepo
    driverMenu
    return
    ;;
  n | N)
    printf "%b\n" "${RED} Exiting the Script ${RC}"
    return
    ;;
  *)
    printf "%b\n" "${RED} Invalid Option! ${RC}"
    userConfirmation
    ;;
  esac
}

printf "%b\n" "${YELLOW}Warning! This script will enable Nvidia non-free repository and only install drivers for GPUs from 2014 or later. It works on fedora 34 and above.\n It is recommended remove this driver while updating your kernel packages to newer version.${RC}"

checkEnv
userConfirmation
