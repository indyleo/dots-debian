#!/bin/env bash
conky -c ~/.config/conky/conky-01.conkyrc &
volumeicon &
solaar -w hide & 
variety &
xfce4-clipman &
xrandr --auto &
exec awesome
