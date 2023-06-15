#!/bin/env bash
udiskie &
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}" &
xrandr --auto &

if [ "$1" = "awesome" ]; then
  exec awesome
elif [ "$1" = "bspwm" ]; then
  exec bspwm
else
  exec awesome
fi
