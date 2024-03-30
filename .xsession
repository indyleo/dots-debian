#!/bin/env bash

WMC="$1"
ACC=$(whoami)

udiskie &
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"

if [[ $(xrandr -q | grep 'HDMI-0 connected' ) ]]; then
  xrandr --output HDMI-0 --mode 1920x1080 --rate 75.00 --primary --output eDP-1-1 --right-of HDMI-0 --mode 1920x1080 --rate 120.00
else
 xrandr --auto
fi

case $WMC in
  awesome)
    exec awesome ;;
  dwm)
    exec dwm ;;
  xmonad)
    exec xmonad-session ;;
  qtile)
    "/home/$ACC/.local/bin/qtile" start ;;
  *)
    echo "$WMC is not an option" ;;
esac
