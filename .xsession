#!/bin/env bash

# Start necessary services
udiskie &

# Configure NVIDIA settings
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"

# Check for HDMI connection and configure display settings accordingly
if xrandr -q | grep -q 'HDMI-0 connected'; then
  xrandr --output HDMI-0 --mode 1920x1080 --rate 75.00 --primary \
         --output eDP-1-1 --right-of HDMI-0 --mode 1920x1080 --rate 120.00
else
  xrandr --auto
fi

# Check for the selected window manager in ~/.wm_session or use a default
WMC="${XDG_CONFIG_HOME:-$HOME/.config}/wm_session"
if [[ -f "$WMC" ]]; then
  WM="$(cat "$WMC")"
else
  WM="awesome"  # Default if no session file exists
fi

# Launch the selected window manager
case "$WM" in
  awesome) exec awesome ;;
  qtile) exec "$HOME/.local/bin/qtile" start ;;
  dwm) exec dwm ;;
  xmonad) exec xmonad-session ;;
  *)
    echo "Invalid window manager: $WM. Defaulting to awesome."
    exec awesome
    ;;
esac
