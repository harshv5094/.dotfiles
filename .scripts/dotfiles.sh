#! /usr/bin/env bash

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
if [ -f "$HOME/BrewFile" ]; then
	echo "Deleting Existing BrewFile"
	rm -rf "$HOME/BrewFile"
	echo "Linking BrewFile"
	ln -s "$HOME/.dotfiles/.scripts/BrewFile" "$HOME/BrewFile"
else
	echo "Linking BrewFile"
	ln -s "$HOME/.dotfiles/.scripts/BrewFile" "$HOME/BrewFile"
fi

# vimrc file
if [ -f "$HOME/.vimrc" ]; then
    echo "Deleting Existing .vimrc"
    rm -rf "$HOME/.vimrc"
    echo "Linking Vimrc"
    ln -s "$HOME/.dotfiles/.scripts/.vimrc" "$HOME/.vimrc"
else
    echo "Linking Vimrc"
    ln -s "$HOME/.dotfiles/.scripts/.vimrc" "$HOME/.vimrc"
fi
