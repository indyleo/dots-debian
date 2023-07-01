#!/bin/env bash
udiskie &
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
xrandr --auto
exec awesome
