#!/bin/env bash
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}" &
xrandr --auto &
exec awesome
