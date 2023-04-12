#!/bin/env bash
conky -c ~/.config/conky/conky-01.conkyrc &
volumeicon &
solaar -w hide & 
xfce4-clipman &
variety & 
xrandr --auto &
exec awesome
