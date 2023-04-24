# Backround Programs
picom --experimental-backends --config ~/.config/picom/picom-polyawe.conf &
lxpolkit &
sxhkd &

# Conky
killall -q conky &
sleep 3 && conky -c ~/.config/conky/awesome/conky-polybar.conkyrc &

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
find ~/Pictures/Wallpapers/ -type f | shuf -n 1 | xargs xwallpaper --stretch &
# ~/.fehbg &
# feh --randomize --bg-fill ~/Pictures/Wallpapers/ &
# nitrogen --restore &
# nitrogen --random ~/Pictures/Wallpapers/ &
