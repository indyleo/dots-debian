#!/bin/env bash

# Fix Mouse Cursor On Startup 
xsetroot -cursor_name left_ptr

# Set Keyboard Layout
setxkbmap -layout us

# Killing Of Programs
killall -q solaar
killall -q sxhkd
killall -q greenclip

# Starting Programs
picom &
sxhkd  &
lxpolkit &
greenclip daemon &
solaar -w hide &

# Wallpaper
xwallpaper --stretch ~/Pictures/Wallpapers/3xsraffkwi1a1.png &
