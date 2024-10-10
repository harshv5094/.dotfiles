#!/usr/bin/env bash

function have() {
  command -v "$1" &>/dev/null
}

if ! have ansible; then
  echo "Installing ansible"
  if have dnf; then
    sudo dnf install ansible
  elif have pacman; then
    sudo pacman -S ansible
  fi
else
  echo "ansible is installed"
fi

# Run ansible
if have dnf; then
  ansible-playbook -i ~/.dotfiles/ansible/hosts.ini ~/.dotfiles/ansible/os/fedora.yaml --ask-become-pass
elif have pacman; then
  ansible-playbook -i ~/.dotfiles/ansible/hosts.ini ~/.dotfiles/ansible/os/arch.yaml --ask-become-pass
fi
