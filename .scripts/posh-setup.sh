#!/bin/sh -e

. "$HOME/dotfiles/.scripts/common-script.sh"

poshSetup() {
  printf "%b\n" "${CYAN} Welcome to Oh My Posh Setup ${RC}"
  printf "%b\n" "${YELLOW} 1. Install\n 2. Update\n q. Exit ${RC}"
  printf "%b" " Enter Your Choice: "
  read -r choice

  case $choice in
  1)
    if command_exists oh-my-posh; then
      printf "%b\n" "${GREEN} Oh My Posh is installed your system  ${RC}"
      return
    else
      printf "%b\n" "${YELLOW} Installing Oh My Posh ${RC}"
      curl -s https://ohmyposh.dev/install.sh | bash -s
      return
    fi
    ;;

  2)
    if command_exists nix; then
      printf "%b\n" "${YELLOW} Updating oh my posh ${RC}"
      oh-my-posh upgrade
      return
    else
      printf "%b\n" "${RED} Oh My Posh is not Installed ${RC}"
      return
    fi
    ;;

  q | Q)
    return
    ;;

  *)
    printf "%b\n" "${RED} Invalid option ${RC}"
    nixSetup
    ;;
  esac

}

poshSetup
