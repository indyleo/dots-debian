#!/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bars
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log /tmp/polybar3.log
polybar awesome1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar awesome2 2>&1 | tee -a /tmp/polybar2.log & disown
polybar awesome3 2>&1 | tee -a /tmp/polybar3.log & disown
echo "Bars launched..."
