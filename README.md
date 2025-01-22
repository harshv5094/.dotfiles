---
name: README
description: This is my dotfiles docs
---
# 🔨 My Dotfiles

⚠️ Warning: Don't blindly use my setup unless you know what it is. Use it at your own risk!

## Table of Contents

- [Font Dependency](#font-dependency)
- [How to install my setup](#how-to-install-my-setup)

## Font Dependency

Some configuration needs nerd fonts to properly show icons. You can download the font from [here](https://www.nerdfonts.com/font-downloads). I am using `JetBrainsMono Nerd Font` in my setup.

## How to install my setup

### Linux

For now, I'm using arch-linux. Run this commands below, to install my setup

```sh
cd ~/.dotfiles/
stow .
arch-setup
```

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
