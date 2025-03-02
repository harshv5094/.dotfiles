#!/usr/bin/env bash

# Define the menu options
options="Lock\nLogout\nHibernate\nReboot\nShutdown\nSuspend"

# Show the menu using Rofi
choice=$(printf "%b" "$options" | rofi -dmenu -i -p "⏻ " -lines 6 -width 20)

# Function to show confirmation dialog
confirm() {
  echo -e "No\nYes" | rofi -dmenu -i -p "Are you sure?" -lines 2 -width 20
}

# Execute action based on choice
case "$choice" in
Lock)
  [ "$(confirm)" = "Yes" ] && hyprctl dispatch exec hyprlock
  ;;
Logout)
  [ "$(confirm)" = "Yes" ] && hyprctl dispatch exit 0
  ;;
Hibernate)
  [ "$(confirm)" = "Yes" ] && systemctl hibernate
  ;;
Reboot)
  [ "$(confirm)" = "Yes" ] && systemctl reboot
  ;;
Shutdown)
  [ "$(confirm)" = "Yes" ] && systemctl poweroff
  ;;
Suspend)
  [ "$(confirm)" = "Yes" ] && systemctl suspend
  ;;
*)
  exit 0
  ;;
esac
