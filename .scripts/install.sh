#!/usr/bin/env bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

function dotfiles() {
	# .bashrc
	if [ -f "$HOME/.bashrc" ]; then
		echo -e -e "${RED}Deleting Existing .bashrc${NC}"
		rm -rf "$HOME/.bashrc"
		echo -e "${GREEN}Linking .bashrc"
		ln -s "$HOME/.dotfiles/dot/.bashrc" "$HOME/.bashrc"
	else
		echo -e "${GREEN}Linking .bashrc"
		ln -s "$HOME/.dotfiles/dot/.bashrc" "$HOME/.bashrc"
	fi

	# .bash_aliases
	if [ -f "$HOME/.bash_aliases" ]; then
		echo -e "${RED}Deleting Existing .bashrc${NC}"
		rm -rf "$HOME/.bash_aliases"
		echo -e "${GREEN}Linking .bash_aliases"
		ln -s "$HOME/.dotfiles/dot/.bash_aliases" "$HOME/.bash_aliases"
	else
		echo -e "${GREEN}Linking .bash_aliases"
		ln -s "$HOME/.dotfiles/dot/.bash_aliases" "$HOME/.bash_aliases"
	fi

	# .gitconfig
	if [ -f "$HOME/.gitconfig" ]; then
		echo -e "${RED}Deleting Existing .gitconfig${NC}"
		rm -rf "$HOME/.gitconfig"
		echo -e "${GREEN}Linking .gitconfig"
		ln -s "$HOME/.dotfiles/dot/.gitconfig" "$HOME/.gitconfig"
	else
		echo -e "${GREEN}Linking .gitconfig"
		ln -s "$HOME/.dotfiles/dot/.gitconfig" "$HOME/.gitconfig"
	fi

	# Brew File
	if [ -f "$HOME/BrewFile" ]; then
		echo -e "${RED}Deleting Existing BrewFile${NC}"
		rm -rf "$HOME/BrewFile"
		echo -e "${GREEN}Linking BrewFile"
		ln -s "$HOME/.dotfiles/.scripts/BrewFile" "$HOME/BrewFile"
	else
		echo -e "${GREEN}Linking BrewFile"
		ln -s "$HOME/.dotfiles/.scripts/BrewFile" "$HOME/BrewFile"
	fi

	# vimrc file
	if [ -f "$HOME/.vimrc" ]; then
		echo -e "${RED}Deleting Existing .vimrc${NC}"
		rm -rf "$HOME/.vimrc"
		echo -e "${GREEN}Linking Vimrc"
		ln -s "$HOME/.dotfiles/.scripts/.vimrc" "$HOME/.vimrc"
	else
		echo -e "${GREEN}Linking Vimrc"
		ln -s "$HOME/.dotfiles/.scripts/.vimrc" "$HOME/.vimrc"
	fi

}

function config_folders() {
	# nvim folder
	if [ -d "$HOME/.config/nvim" ]; then
		echo -e "${RED}Deleting Existing Nvim Config Folder${NC}"
		rm -rf "$HOME/.config/nvim"
		echo -e "${GREEN}Linking Nvim Config Folder"
		ln -s "$HOME/.dotfiles/.config/nvim" "$HOME/.config/"
	else
		echo -e "${GREEN}Linking Nvim Config Folder"
		ln -s "$HOME/.dotfiles/.config/nvim" "$HOME/.config/"
	fi

	# Tmux Folder
	if [ -d "$HOME/.config/tmux" ]; then
		echo -e "${RED}Deleting Existing Nvim Config Folder${NC}"
		rm -rf "$HOME/.config/tmux"
		echo -e "${GREEN}Linking Tmux Config Folder"
		ln -s "$HOME/.dotfiles/.config/tmux" "$HOME/.config/"
	else
		echo -e "${GREEN}Linking Tmux Config Folder"
		ln -s "$HOME/.dotfiles/.config/tmux" "$HOME/.config/"
	fi

	# Oh My Posh Folder
	if [ -d "$HOME/.config/themes" ]; then
		echo -e "${RED}Deleting Existing Oh My Posh Config Folder${NC}"
		rm -rf "$HOME/.config/themes"
		echo -e "${GREEN}Linking Oh My Posh Config Folder"
		ln -s "$HOME/.dotfiles/.config/themes/" "$HOME/.config/"
	else
		echo -e "${GREEN}Linking Oh My Posh Config Folder"
		ln -s "$HOME/.dotfiles/.config/themes/" "$HOME/.config/"
	fi
}

echo -e -e "${YELLOW}Welcome to My Setup installation script.${NC}"

PS3="Please Select An Option: "

select option in "Link My dotfiles" "Link My Folders" "Run My Fish Configuration script 🐟" "Quit ❌"; do
	case $option in
	"Link My dotfiles")
		dotfiles
		;;

	"Link My Folders")
		config_folders
		;;

	"Run My Fish Configuration script 🐟")
		./fish.sh
		;;

	"Quit ❌")
		echo -e -e "${GREEN}We're done${NC}"
		break
		;;

	*)
		echo -e -e "${RED}Ooops Wrong Option${NC}"
		;;

	esac
done
