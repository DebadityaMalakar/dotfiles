#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    echo "Detected Debian-based system (Ubuntu)."
    sudo apt-get update
    sudo apt-get install rofi polybar i3 i3status i3lock
else
    echo "Detected non-Debian-based system."
    sudo xbps-install -S rofi polybar i3 i3status i3lock
fi

mkdir -p ~/.config

if [[ -d ~/.i3 ]]; then
    cp -r ~/.i3 ~/.config/
    echo "i3 configuration copied to ~/.config/"
else
    echo "i3 configuration folder not found."
fi

# Move or copy polybar configuration folder
if [[ -d ~/.config/polybar ]]; then
    cp -r ~/.config/polybar ~/.config/
    echo "polybar configuration copied to ~/.config/"
else
    echo "polybar configuration folder not found."
fi
