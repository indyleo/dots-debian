#!/bin/env bash

# Killing Of Programs
killall -q solaar &
killall -q sxhkd &
killall -q greenclip &

# Starting Programs
picom &
sxhkd &
lxpolkit &
sleep 1 && greenclip daemon &
solaar -w hide &

# Wallpapers
# find ~/Pictures/Wallpapers/ -type f | shuf -n 1 | xargs xwallpaper --stretch &
# ~/.fehbg &
 feh --randomize --bg-fill ~/Pictures/Wallpapers/ &
# nitrogen --restore &
# nitrogen --random ~/Pictures/Wallpapers/ &

