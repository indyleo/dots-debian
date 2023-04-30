#!/bin/env bash

# Killing Of Programs
killall -q picom & 
killall -q sxhkd &
killall -q conky &
killall -q solaar &
killall -q greenclip &

# Starting Programs
sleep 1 && picom --experimental-backends &
lxpolkit &
sxhkd &
greenclip daemon &
sleep 3 && conky -c ~/.config/conky/awesome/conky-01.conkyrc &
solaar -w hide &

# Wallpapers
# find ~/Pictures/Wallpapers/ -type f | shuf -n 1 | xargs xwallpaper --stretch &
# ~/.fehbg &
 feh --randomize --bg-fill ~/Pictures/Wallpapers/ &
# nitrogen --restore &
# nitrogen --random ~/Pictures/Wallpapers/ &

