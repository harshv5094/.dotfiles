#!/usr/bin/env bash

# nvim folder
if [ -d "$HOME/.config/nvim" ]; then
	echo "Deleting Existing Nvim Config Folder"
	rm -rf "$HOME/.config/nvim"
	echo "Linking Nvim Config Folder"
	ln -s "$HOME/.dotfiles/.config/nvim" "$HOME/.config/"
else
	echo "Linking Nvim Config Folder"
	ln -s "$HOME/.dotfiles/.config/nvim" "$HOME/.config/"
fi

# Tmux Folder
if [ -d "$HOME/.config/tmux" ]; then
	echo "Deleting Existing Nvim Config Folder"
	rm -rf "$HOME/.config/tmux"
	echo "Linking Tmux Config Folder"
	ln -s "$HOME/.dotfiles/.config/tmux" "$HOME/.config/"
else
	echo "Linking Tmux Config Folder"
	ln -s "$HOME/.dotfiles/.config/tmux" "$HOME/.config/"
fi

# Oh My Posh Folder
if [ -d "$HOME/.config/themes" ]; then
	echo "Deleting Existing Oh My Posh Config Folder"
	rm -rf "$HOME/.config/themes"
	echo "Linking Oh My Posh Config Folder"
	ln -s "$HOME/.dotfiles/.config/themes/" "$HOME/.config/"
else
	echo "Linking Oh My Posh Config Folder"
	ln -s "$HOME/.dotfiles/.config/themes/" "$HOME/.config/"
fi
