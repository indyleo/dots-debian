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

# Ensure a window manager argument is provided
if [[ -z "$1" ]]; then
    echo "Error: No window manager specified." >&2
    echo "Usage: /etc/X11/Xsession <window_manager>" >&2
    exit 1
fi

WM="$1"

# Launch the specified window manager
case "$WM" in
    awesome) exec awesome ;;
    qtile) exec qtile start ;;
    *)
        echo "Error: Invalid window manager '$WM'." >&2
        exit 1
        ;;
esac
