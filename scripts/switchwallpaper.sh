#!/bin/bash

WALLPAPER_DIR="/home/mjulliat/Pictures/wallpaper"

WALLPAPER=$(find "$WALLPAPER_DIR" -type f -name "*.jpg" | shuf -n 1)

if [ -z "$WALLPAPER" ]; then
	echo "Error: No image found in $WALLPAPER_DIR"
	exit 1
fi

export DISPLAY=:0
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER"

wall "Wallpaper updated to: $WALLPAPER"
