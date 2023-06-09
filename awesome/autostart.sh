#!/bin/env bash

# Fix Mouse curoor on startup 
xsetroot -cursor_name left_ptr

# Set Keyboard Layout
setxkbmap -layout us

# Killing Of Programs
killall -q solaar
killall -q sxhkd
killall -q greenclip

# Starting Programs
picom --config "$HOME/.config/awesome/picom.conf" &
sxhkd -c "$HOME/.config/awesome/sxhkdrc" &
lxpolkit &
greenclip daemon &
solaar -w hide &

# Wallpaper
xwallpaper --stretch ~/Pictures/Wallpapers/3xsraffkwi1a1.png &
