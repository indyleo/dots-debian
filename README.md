# My Dotfiles

Distro I Use Is Pop-os

# Preview: ![2023-03-16_16-22](https://user-images.githubusercontent.com/100316787/225743983-6698f8d1-9d04-40cc-9ee0-f5a69ee4510e.png)

# QT & GTK Theme
```
QT_QPA_PLATFORMTHEME=qt5ct
```
Add this to your bottom of '/etc/environment' file with any text editor

# Sddm
```
[Theme]
Current=sugar-candy

[Autologin]
User=your user
Session=awesome
```
Add this into your '/etc/sddm.conf'

# Awesome loading ~/.xsession
In /usr/share/xsessions/awesome.desktop change the exec line to
```
Exec=/etx/X11/Xsession
```
