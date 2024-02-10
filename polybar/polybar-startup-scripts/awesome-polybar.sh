#!/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bars
if [[ $(xrandr -q | grep 'HDMI-0 connected' ) ]]; then
  echo "---" | tee -a /tmp/polybar1.log /tmp/polybar_bar_laptop.log
  polybar awesome_bar 2>&1 | tee -a /tmp/polybar_bar.log & disown
  polybar awesome_bar_laptop 2>&1 | tee -a /tmp/polybar_bar_laptop.log & disown
  echo "Bars launched..."
else
  echo "---" | tee -a /tmp/polybar_bar_laptop.log
  polybar awesome_bar_laptop 2>&1 | tee -a /tmp/polybar_bar_laptop.log & disown
  echo "Bars launched..."
fi
