# My Dotfiles
Distro I Use Is Pop-os With AwesomWM

# Why Is Their Rando Configs
The reason why the "pacman.conf, dnf.conf, and sorces.list" is still their because its just allows me to more easily switch to a diffrent distro i want or need to

# Preview : 
![2023-04-27_23-23](https://user-images.githubusercontent.com/100316787/235046943-977f3a49-f7bd-4ea2-ac33-083dc09080bf.png)


# Awesome loading ~/.xsession
In /usr/share/xsessions/awesome.desktop change the exec line to
```
Exec=/etc/X11/Xsession
```

# Qt And GTK Themes
```
QT_QPA_PLATFORMTHEME=qt5ct 
```
Put this into your '/etc/environment' file

# Wlan Interface
To find your wlan interface for polybar do 'nmcli' and the interface tou are connected to is the one to use

# Resources (Dotfiles)
- [Titus-Awesome](https://github.com/ChrisTitusTech/titus-awesome) Hosted On Github
- [DWT1-Awesome](https://gitlab.com/dwt1/dotfiles/-/tree/master/.config/awesome) Hosted On Gitlab

Thanks To These People Who Inspired Me To Use A Tilling Window Manager

# Resources (Websites)
- [AwesomeWM](https://awesomewm.org/) My Choice Of X11 Window Manager
- [Picom](https://github.com/yshui/picom) My Choice Of My X11 Compositer
