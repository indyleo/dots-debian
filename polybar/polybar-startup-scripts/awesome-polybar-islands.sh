#!/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bars
if [[ $(xrandr -q | grep 'HDMI-0 connected' ) ]]; then
  echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log /tmp/polybar3.log /tmp/polybar1_laptop.log /tmp/polybar2_laptop.log /tmp/polybar3_laptop.log
  
  polybar awesome1 2>&1 | tee -a /tmp/polybar1.log & disown
  polybar awesome2 2>&1 | tee -a /tmp/polybar2.log & disown
  polybar awesome3 2>&1 | tee -a /tmp/polybar3.log & disown

  polybar awesome1_laptop 2>&1 | tee -a /tmp/polybar1_laptop.log & disown
  polybar awesome2_laptop 2>&1 | tee -a /tmp/polybar2_laptop.log & disown
  polybar awesome3_laptop 2>&1 | tee -a /tmp/polybar3_laptop.log & disown
  echo "Bars launched..."
else
  echo "---" | tee -a /tmp/polybar1_laptop.log /tmp/polybar2_laptop.log /tmp/polybar3_laptop.log
  
  polybar awesome1_laptop 2>&1 | tee -a /tmp/polybar1_laptop.log & disown
  polybar awesome2_laptop 2>&1 | tee -a /tmp/polybar2_laptop.log & disown
  polybar awesome3_laptop 2>&1 | tee -a /tmp/polybar3_laptop.log & disown
  echo "Bars launched..."
fi
