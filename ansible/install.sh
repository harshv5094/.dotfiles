#!/usr/bin/env bash

function have() {
  command -v "$1" &>/dev/null
}

if ! have ansible; then
  sudo dnf install ansible
else
  echo "ansible is installed"
fi

if ! have brew; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "homebrew is installed"
fi

# Run ansible
ansible-playbook -i ~/.dotfiles/ansible/hosts ~/.dotfiles/ansible/linux.yaml --ask-become-pass
