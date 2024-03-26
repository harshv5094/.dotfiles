#!/usr/bin/env bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

function dotfiles() {
	# .bashrc
	if [ -e "$HOME/.bashrc" ]; then
		echo -e -e "${RED}Deleting Existing .bashrc${NC}"
		rm "$HOME/.bashrc"
		echo -e "${GREEN}Linking .bashrc"
		ln -s "$HOME/.dotfiles/dot/.bashrc" "$HOME/.bashrc"
	else
		echo -e "${YELLOW}Linking .bashrc"
		ln -s "$HOME/.dotfiles/dot/.bashrc" "$HOME/.bashrc"
	fi

	# .bash_aliases
	if [ -e "$HOME/.bash_aliases" ]; then
		echo -e "${RED}Deleting Existing .bashrc${NC}"
		rm "$HOME/.bash_aliases"
		echo -e "${GREEN}Linking .bash_aliases"
		ln -s "$HOME/.dotfiles/dot/.bash_aliases" "$HOME/.bash_aliases"
	else
		echo -e "${YELLOW}Linking .bash_aliases"
		ln -s "$HOME/.dotfiles/dot/.bash_aliases" "$HOME/.bash_aliases"
	fi

	# .gitconfig
	if [ -e "$HOME/.gitconfig" ]; then
		echo -e "${RED}Deleting Existing .gitconfig${NC}"
		rm "$HOME/.gitconfig"
		echo -e "${GREEN}Linking .gitconfig"
		ln -s "$HOME/.dotfiles/dot/.gitconfig" "$HOME/.gitconfig"
	else
		echo -e "${YELLOW}Linking .gitconfig"
		ln -s "$HOME/.dotfiles/dot/.gitconfig" "$HOME/.gitconfig"
	fi

	# Brew File
	if [ -e "$HOME/Brewfile" ]; then
		echo -e "${RED}Deleting Existing Brewfile${NC}"
		rm "$HOME/Brewfile"
		echo -e "${GREEN}Copying Brewfile to home directory"
		ln -s "$HOME/.dotfiles/dot/Brewfile" "$HOME/Brewfile"
	else
		echo -e "${GREEN}Copying Brewfile to home directory"
		ln -s "$HOME/.dotfiles/dot/Brewfile" "$HOME/Brewfile"
	fi

	# vimrc file
	if [ -e "$HOME/.vimrc" ]; then
		echo -e "${RED}Deleting Existing .vimrc${NC}"
		rm "$HOME/.vimrc"
		echo -e "${GREEN}Linking Vimrc"
		ln -s "$HOME/.dotfiles/dot/.vimrc" "$HOME/.vimrc"
	else
		echo -e "${YELLOW}Linking Vimrc"
		ln -s "$HOME/.dotfiles/dot/.vimrc" "$HOME/.vimrc"
	fi

}

function config_folders() {
	# nvim folder
	if [ -d "$HOME/.config/nvim" ]; then
		echo -e "${RED}Deleting Existing Nvim Config Folder${NC}"
		rm "$HOME/.config/nvim"
		echo -e "${GREEN}Linking Nvim Config Folder"
		ln -s "$HOME/.dotfiles/.config/nvim" "$HOME/.config/"
	else
		echo -e "${YELLOW}Linking Nvim Config Folder"
		ln -s "$HOME/.dotfiles/.config/nvim" "$HOME/.config/"
	fi

	# Tmux Folder
	if [ -d "$HOME/.config/tmux" ]; then
		echo -e "${RED}Deleting Existing Nvim Config Folder${NC}"
		rm "$HOME/.config/tmux"
		echo -e "${GREEN}Linking Tmux Config Folder"
		ln -s "$HOME/.dotfiles/.config/tmux" "$HOME/.config/"
	else
		echo -e "${YELLOW}Linking Tmux Config Folder"
		ln -s "$HOME/.dotfiles/.config/tmux" "$HOME/.config/"
	fi

	# Oh My Posh Folder
	if [ -d "$HOME/.config/themes" ]; then
		echo -e "${RED}Deleting Existing Oh My Posh Config Folder${NC}"
		rm -rf "$HOME/.config/themes"
		echo -e "${GREEN}Linking Oh My Posh Config Folder"
		ln -s "$HOME/.dotfiles/.config/themes/" "$HOME/.config/"
	else
		echo -e "${YELLOW}Linking Oh My Posh Config Folder"
		ln -s "$HOME/.dotfiles/.config/themes/" "$HOME/.config/"
	fi
}

function brew_check() {
	if command -v brew &>/dev/null; then
		echo -e "${RED}Homebrew is not installed in your system${NC}"
		echo -e "${YELLOW}Installing Homebrew${NC}"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	else
		echo -e "${GREEN}Homebrew is installed in your system${NC}"
	fi
}

function brew_package_install() {
	if command -v brew &>/dev/null; then
		echo -e "${YELLOW}Installing Homebrew Packages${NC}"
		brew bundle install --file="$HOME/Brewfile"
	else
		echo -e "${RED}Homebrew is not installed in your system${NC}"
		echo -e "${YELLOW}Installing Homebrew${NC}"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
}

function vim_configuration() {
	if [ -d "$HOME/.vim" ]; then
		echo -e "${YELLOW}Copying config-settings.json${NC}"
		ln -s "$HOME/.dotfiles/scripts/coc-settings.json" "$HOME/.vim/coc-settings.json"
	else
		echo -e "${RED}Vim Plug is not installed${NC}"
		echo -e "${YELLOW}Installling Vim Plugin${NC}"
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		echo -e "${YELLOW}Copying config-settings.json${NC}"
		ln -s "$HOME/.dotfiles/scripts/coc-settings.json" "$HOME/.vim/coc-settings.json"
	fi
}

echo -e -e "${YELLOW}Welcome to My Setup installation script.${NC}"

PS3="Your Option: "

select option in "Link My dotfiles 🔯" "Link My Folders 📁" "Vim Config" "Homebrew Check 🍺" "Homebrew Packages 🍺" "Run My Fish Configuration script 🐟" "Quit ❌"; do
	case $option in
	"Link My dotfiles 🔯")
		dotfiles
		;;

	"Link My Folders 📁")
		config_folders
		;;

	"Vim Config")
		vim_configuration
		;;

	"Homebrew Check 🍺")
		brew_check
		;;

	"Homebrew Packages 🍺")
		brew_package_install
		;;

	"Run My Fish Configuration script 🐟")
		~/.dotfiles/scripts/fish.sh
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
