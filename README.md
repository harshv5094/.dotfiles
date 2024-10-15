---
name: README
description: This is my dotfiles docs
---
# 🔨 My Dotfiles

⚠️ Warning: Don't blindly use my setup unless you know what it is. Use it at your own risk!

## Table of Contents

- [Introduction](#introduction)
- [Font Dependency](#font-dependency)
- [How to install my setup](#how-to-install-my-setup)

## Introduction

My setup is inspired from [craftzdog's](https://github.com/craftzdog/dotfiles-public) setup. This setup contains some of his configuration with my customization mixed in it.

## Font Dependency

Some configuration needs nerd fonts to properly show icons. You can download the font from [here](https://www.nerdfonts.com/font-downloads). I am using `JetBrainsMono Nerd Font` in my setup.

## How to install my setup

### Linux and MacOS

Install `ansible` in your system and run `install.sh` in `.dotfiles/ansible` directory.

My Setup is based on two distros.

1. Fedora
2. Arch Linux

```sh
cd ~/.dotfiles/ansible/
./install.sh
# For now I've completed rpm based distro and arch linux setup.
```

### Windows

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
~/.dotfiles/.scripts/install.ps1
```

## FAQ

### My `bat` config is not working properly?

- To use bat config just run this command first:

```sh
bat cache --build
```
