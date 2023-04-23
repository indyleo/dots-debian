# Backround Programs
picom --experimental-backends --config ~/.config/picom/picom-polyawesome.conf &
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
killall -q solaar &
sleep 3 && solaar -w hide &
killall -q xfce4-clipman &
sleep 3 && xfce4-clipman &

# Wallpapers
# xwallpaper --stretch ~/Pictures/Wallpapers/nord_mountains.png
find ~/Pictures/Wallpapers/ -type f | shuf -n 1 | xargs xwallpaper --stretch &
# feh --randomize --bg-fill ~/Pictures/Wallpapers/ &
# ~/.fehbg &
# nitrogen --set-zoom --random ~/Pictures/Wallpapers/ &
# nitrogen --restore &

# Variety
killall -q variety &
sleep 3 && variety &
