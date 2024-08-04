#!/usr/bin/env bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
else
	ufw limit 22/tcp
	ufw allow 80/tcp
	ufw allow 443/tcp
	ufw default deny incoming
	ufw default allow outgoing
	ufw enable
fi
