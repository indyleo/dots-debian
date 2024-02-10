# My Dotfiles
Distro I Use Is Debian 12 With AwesomWM

# Preview
![image](https://github.com/indyleo/dots-debian/assets/100316787/64576f0f-f330-4d51-ad2f-38358b2bed3e)

# Awesome loading ~/.xsession
Change the exec line in your awesome.desktop file in /usr/share/xsessions to
```
Exec=/etc/X11/Xsession 
```

# Qt And GTK Themes
Put this into your '/etc/environment' file
```
QT_QPA_PLATFORMTHEME=qt5ct 
```

# Sudo Settings
Put this into your sudoers file
```
Defaults        pwfeedback
```

# Wlan Interface
To find your wlan interface for polybar do 'nmcli' and the interface u are connected to is the one to use

# Resources (Dotfiles)
- [Titus-Awesome](https://github.com/ChrisTitusTech/titus-awesome) Hosted On Github
- [DWT1-Awesome](https://gitlab.com/dwt1/dotfiles/-/tree/master/.config/awesome) Hosted On Gitlab

# Resources (Websites)
- [AwesomeWM](https://awesomewm.org/) My Choice Of X11 Window Manager
- [Picom](https://github.com/yshui/picom) My Choice Of My X11 Compositer
- [Sxhkd](https://github.com/baskerville/sxhkd) My Choice Of My X11 Hotkey Daemon
- [Polybar](https://polybar.github.io/) My Choice Of My X11 Bar 
