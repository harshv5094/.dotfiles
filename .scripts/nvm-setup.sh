#!/bin/sh -s

. "$HOME/.dotfiles/.scripts/common-script.sh"

if command_exist nvm; then
  nvm install lts
  echo lts >>~/.nvmrc
  npm i -g commitizen cz-conventional-changelog yarn bun
fi
