#!/bin/env bash
killall -q polybar
polybar awesome 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."
