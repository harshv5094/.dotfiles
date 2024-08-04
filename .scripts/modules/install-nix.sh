#!/usr/bin/env bash

function have() {
  command -v "$1" &>/dev/null
}

have nix-env || curl -L https://nixos.org/nix/install | sh -s -- --daemon

nix-env -iA $(grep -vE "^\s*#" ~/.dotfiles/.scripts/package-text-file/nix.txt | tr "\n" " ")
