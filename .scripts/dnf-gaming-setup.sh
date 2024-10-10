#!/bin/sh -e

printf "Installing packages"
sudo dnf install steam lutris wine mangohud

printf "Installing ProtonUp-Qt"
flatpak install flathub net.davidotek.pupgui2
