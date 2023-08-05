#!/bin/env bash

# Fix Mouse Cursor On Startup 
xsetroot -cursor_name left_ptr

# Set Keyboard Layout
setxkbmap -layout us

# Monitor Stop Turning Off
xset s off -dpms

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

# Setting Up Autolock
xautolock -time 15 -locker locker &

# Wallpaper
xwallpaper --stretch ~/Pictures/Wallpapers/3xsraffkwi1a1.png &
