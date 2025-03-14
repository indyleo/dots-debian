#!/bin/env bash

# Check if HDMI-0 is connected
if xrandr -q | grep -q 'HDMI-0 connected'; then
  programs=(
    "solaar -w hide"
    "sxhkd -c $XDG_CONFIG_HOME/awesome/sxhkdrc"
    "picom -c $XDG_CONFIG_HOME/awesome/picom.conf"
    "lxpolkit"
    "greenclip daemon"
    "polybar awesome_bar"
    "polybar awesome_bar_laptop"
  )
else
  programs=(
    "solaar -w hide"
    "sxhkd -c $XDG_CONFIG_HOME/awesome/sxhkdrc"
    "picom -c $XDG_CONFIG_HOME/awesome/picom.conf"
    "lxpolkit"
    "greenclip daemon"
    "polybar awesome_bar_laptop"
  )
fi

# Kill existing instances
for prog in "${programs[@]}"; do
  proc_name=$(echo "$prog" | awk '{print $1}')
  killall -q "$proc_name"
done

# Start new instances
for prog in "${programs[@]}"; do
  proc_name=$(echo "$prog" | awk '{print $1}')
  if command -v "$proc_name" &>/dev/null; then
    $prog &
  fi
done
