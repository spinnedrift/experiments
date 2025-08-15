#!/bin/sh

# Replace default terminal keybinding for Kitty with Ptyxis
sed -i 's/kitty/ptyxis/g' /usr/share/hyprland/hyprland.conf

# Replace default terminal keybinding for Thunar with Nemo
sed -i 's/thunar/nemo/g' /usr/share/hyprland/hyprland.conf
