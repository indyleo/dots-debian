#!/bin/env bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Update packages list and update system
pacman -Syu

# Installing CLI programs
pacman -S lazygit starship lsd autojump nano yad fzf locate gh tree xsel tty-clock libhidapi-dev gpg openssl tldr htop trash-cli neovim cmake g++ wget python3 xdotool unzip tar python3-setuptools ripgrep fd-find luarocks ranger golang-go shellcheck python3-venv git build-essential --noconfirm

# Installing other pkg managers
pacman -S cargo python3-pip npm flatpak --noconfirm

# Installing Fun Stuff
pacman -S neofetch cmatrix tty- --noconfirm

# Installing zsh
pacman -S zsh zsh-syntax-highlighting zsh-history-substring-search zsh-completions --noconfirm

# Installing java 
pacman -S openjdk-8-jdk openjdk-8-jre openjdk-17-jdk openjdk-17-jre --noconfirm

# Installing GUI programs 
pacman -S rpi-imager bleachbit sxiv timeshift mesa-utils transmission-gtk dconf-editor solaar virt-manager steam:i386 --noconfirm

# Installing a music player
pacman -S rhythmbox rhythmbox-plugins --noconfirm

# Installing media stuff
pacman -S yt-dlp mpv peek obs-studio kdenlive audacity gimp inkscape vlc --noconfirm

# Installing AwesomeWM Stuff
pacman -S variety awesome-doc awesome-extra qt5ct qt5-style-plugins xfce4-clipman xterm awesome pcmanfm alacritty rofi feh picom i3lock-fancy lxappearance arandr xclip xbacklight flameshot network-manager-gnome lxpolkit volumeicon-alsa pavucontrol --noconfirm

# Rofi-Calc Script Depeninces
pacman -S rofi-dev qalc libtool --noconfirm

# Installing Browsers
pacman -S firefox chromium qutebrowser libjs-pdf --noconfirm

# Script Variables
username=$(id -u -n 1000)

# Installing fonts 
pacman -S fonts-font-awesome --noconfirm
mkdir -p /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/SourceCodePro.zip
unzip SourceCodePro.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*

# Reloading cache
fc-cache -vf
# Removing zip files
rm ./FiraCode.zip ./Meslo.zip ./SourceCodePro.zip

# Setting up ufw 
pacman -S ufw --noconfirm
sleep 2.5
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable

# Neovim Stuff
npm i -g neovim tree-sitter-cli

# Pfetch
wget https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch
chmod a+x pfetch
mv pfetch /usr/bin/pfetch

# Nerd Fetch
wget https://raw.githubusercontent.com/ThatOneCalculator/NerdFetch/master/nerdfetch 
chmod a+x nerdfetch
mv nerdfetch /usr/bin/nerdfetch