#!/bin/sh -e

. "$HOME/.dotfiles/.scripts/common-script.sh"

nixSetup() {
  printf "%b\n" "${CYAN} Welcome to Nix Package Manager Setup ${RC}"
  printf "%b\n" "${YELLOW} 1. Install\n 2. Setup Packages\n 3. Update\n q. Exit ${RC}"
  printf "%b" " Enter Your Choice: "
  read -r choice

  case $choice in

  1)
    if command_exists nix; then
      printf "%b\n" "${GREEN} Nix is installed your system  ${RC}"
      return
    else
      printf "%b\n" "${YELLOW} Installing Nix Package Manager ${RC}"
      curl -L https://nixos.org/nix/install | sh
      return
    fi
    ;;

  2)
    if command_exists nix; then
      printf "%b\n" "${GREEN} Installing your packages ${RC}"
      nix-env -iA $(grep -vE "^\s*#" ~/.dotfiles/.scripts/txt-pkg-list/nix.txt | tr "\n" " ")
      return
    else
      printf "%b\n" "${RED} Please! Execute your 1st option to install nix ${RC}"
      return
    fi
    ;;

  3)
    if command_exists nix; then
      printf "%b\n" "${YELLOW} Updating nix ${RC}"
      nix-channel --update && nix-env -u
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

nixSetup
