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

# .bashrc
if [ -f "$HOME/.bashrc" ]; then
	echo "Deleting Existing .bashrc"
	rm -rf "$HOME/.bashrc"
	echo "Linking .bashrc"
	ln -s "$HOME/.dotfiles/dot/.bashrc" "$HOME/.bashrc"
else
	ln -s "$HOME/.dotfiles/dot/.bashrc" "$HOME/.bashrc"
fi

# .bash_aliases
if [ -f "$HOME/.bash_aliases" ]; then
	echo "Deleting Existing .bashrc"
	rm -rf "$HOME/.bash_aliases"
	echo "Linking .bash_aliases"
	ln -s "$HOME/.dotfiles/dot/.bash_aliases" "$HOME/.bash_aliases"
else
	echo "Linking .bash_aliases"
	ln -s "$HOME/.dotfiles/dot/.bash_aliases" "$HOME/.bash_aliases"
fi

# .gitconfig
if [ -f "$HOME/.gitconfig" ]; then
	echo "Deleting Existing .gitconfig"
	rm -rf "$HOME/.gitconfig"
	echo "Linking .gitconfig"
	ln -s "$HOME/.dotfiles/dot/.gitconfig" "$HOME/.gitconfig"
else
	echo "Linking .gitconfig"
	ln -s "$HOME/.dotfiles/dot/.gitconfig" "$HOME/.gitconfig"
fi

# Brew File
# if [ -f "$HOME/BrewFile" ]; then
# 	echo "Deleting Existing BrewFile"
# 	rm -rf "$HOME/BrewFile"
# 	echo "Linking BrewFile"
# 	ln -s "$HOME/.dotfiles/.scripts/BrewFile" "$HOME/BrewFile"
# else
# 	echo "Linking BrewFile"
# 	ln -s "$HOME/.dotfiles/.scripts/BrewFile" "$HOME/BrewFile"
# fi
