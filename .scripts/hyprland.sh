#!/usr/bin/env bash

# Check for sudo execution
if [ "$(id -u)" -eq 0 ]; then
  error_msg "Should not be ran as root !"
  exit 1
fi

# Check config folder #
checkFolderStatus() {
  CONFIG_DIR="$HOME/.config"
  BASE_DIR="$HOME/.dotfiles/hyprland"
  dir_paths="hypr swaync rofi waybar nwg-look xdg-desktop-portal"

  info_msg "Checking folder status..."

  for folder in $dir_paths; do
    if [ -e "${CONFIG_DIR}/${folder}" ]; then
      warning_msg "*** ${CONFIG_DIR}/${folder} exists **"
      mv "${CONFIG_DIR:?}/${folder:?}" "${CONFIG_DIR:?}/${folder:?}.bak"
      info_msg "* Creating symlink for ${folder} directory *"
      ln -s "${BASE_DIR}/${folder}" "${CONFIG_DIR}"
    else
      error_msg "** ${CONFIG_DIR}/${folder} does not exist **"
      info_msg "* Creating symlink for ${folder} directory *"
      ln -s "${BASE_DIR}/${folder}" "${CONFIG_DIR}"
    fi

  done
}

# Custom Sddm Theme #
settingUpSddm() {
  printf "%b" "Do you want to install sddm (Y/N): "
  read -r choice

  case "$choice" in
  y | Y)
    if have paru; then
      warning_msg "** Setting Up SDDM Display Manager **"
      paru -S --noconfirm sddm sddm-astronaut-theme

      warning_msg "** Setting up sddm.conf **"
      printf "[Theme]\nCurrent=sddm-astronaut-theme" | sudo tee /etc/sddm.conf

      if have gdm; then
        warning_msg "Disabling GDM service..."
        sudo systemctl disable gdm.service
      fi

      warning_msg "Enabling SDDM service..."
      sudo systemctl enable sddm.service
    else
      installParu
      settingUpSddm
    fi
    ;;
  n | N)
    success_msg "Skipping home row mods setup."
    ;;
  *)
    warning_msg "Invalid choice. Please enter Y or N."
    ;;
  esac
}

# Install Packages #
packageInstall() {
  if have paru; then
    info_msg "** Installing Hyprland Packages **"
    paru -S --noconfirm kitty hyprland hyprlock hypridle hyprpicker hyprpaper uwsm rofi xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

    info_msg "** Installing Base tools **"
    paru -S --noconfirm pavucontrol brightnessctl playerctl network-manager-applet gnome-keyring power-profiles-daemon \
      wl-clipboard copyq swaync blueman bluez bluez-utils waybar grimblast-git mate-polkit nwg-look \
      xdg-utils xdg-user-dirs xdg-user-dirs-gtk nitch \
      gnome-themes-extra breeze-gtk qt5ct

    info_msg "** Installing GUI tools **"
    paru -S --noconfirm firefox gnome-disk-utility gnome-tweaks gnome-text-editor gnome-clocks gnome-characters \
      transmission-gtk seahorse rhythmbox loupe totem timeshift evince syncthing localsend-bin transmission-gtk baobab visual-studio-code-bin mpv libportal-gtk4 libportal-qt5 libportal-gtk3 libportal-qt6 gst-plugins-ugly

    info_msg "** Installing File Manager **"
    paru -S --noconfirm thunar tumbler libgepub libopenraw thunar-volman thunar-media-tags-plugin thunar-archive-plugin xarchiver

    info_msg "** Installing Fonts & Icons **"
    paru -S --noconfirm noto-fonts noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono-nerd inter-font ttf-firacode-nerd \
      ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono ttf-hanazono noto-fonts-cjk papirus-icon-theme otf-font-awesome

    info_msg "** Setting up XDG Default Directories **"
    xdg-user-dirs-update

    info_msg "** Setting up XDG GTK Default Directories **"
    xdg-user-dirs-gtk-update

  else
    installParu
    packageInstall
  fi
}

# Main function #
main() {
  checkFolderStatus
  packageInstall
  systemdServices cronie bluetooth syncthing@harsh
  settingUpSddm
}

main
