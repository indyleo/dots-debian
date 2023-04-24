# Backround Programs
picom --experimental-backends &
lxpolkit &
sxhkd &

# Conky
killall -q conky &
sleep 3 && conky -c ~/.config/conky/awesome/conky-01.conkyrc &

# Aplleets
nm-applet &
flameshot &
killall -q volumeicon &
sleep 3 && volumeicon &
killall -q xfce4-clipman &
sleep 3 && xfce4-clipman &

# Solaar 
killall -q solaar &
sleep 3 && solaar -w hide &

# Wallpapers
# xwallpaper --stretch ~/Pictures/Wallpapers/nord_mountains.png
find ~/Pictures/Wallpapers/ -type f | shuf -n 1 | xargs xwallpaper --stretch &
