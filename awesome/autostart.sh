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
killall -q xautolock

# Starting Programs
picom &
sxhkd -c $XDG_CONFIG_HOME/awesome/sxhkdrc &
lxpolkit &
greenclip daemon &
solaar -w hide &

# Setting Up Autolock
xautolock -time 15 -locker locker &

# Wallpaper
xwalr ~/Pictures/Wallpaper
# xwalr ~/Pictures/wallpaper
