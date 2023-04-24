# Killing Of Programs
killall -q picom &
killall -q sxhkd & 
killall -q conky &
killall -q volumeicon &
killall -q xfce4-clipman &
killall -q solaar &

# Starting Programs
picom --experimental-backends --config ~/.config/picom/picom-polyawe.conf &
lxpolkit &
sxhkd &
sleep 3 && conky -c ~/.config/conky/awesome/conky-polybar.conkyrc &
nm-applet &
flameshot &
volumeicon &
xfce4-clipman &
solaar -w hide &

# Wallpapers
# find ~/Pictures/Wallpapers/ -type f | shuf -n 1 | xargs xwallpaper --stretch &
# ~/.fehbg &
feh --randomize --bg-fill ~/Pictures/Wallpapers/ &
# nitrogen --restore &
# nitrogen --random ~/Pictures/Wallpapers/ &
