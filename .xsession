#!/bin/env bash
udiskie &
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
xrandr --output HDMI-0 --mode 1920x1080 -- rate 75.00 --primary --output eDP-1-1 --right-of HDMI-0 --mode 1920x1080 -- rate 120.00
exec awesome
