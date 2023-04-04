#!/bin/env bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Update packages list and update system
apt update
apt upgrade -y

# Install nala
apt install nala -y

# Installing CLI programs
nala install autojump nano yad fzf locate gh tree xsel tty-clock libhidapi-dev gpg openssl tldr htop trash-cli neofetch neovim lolcat cmatrix cmake g++ wget python3 xdotool unzip tar python3-setuptools ripgrep fd-find luarocks ranger golang-go shellcheck python3-venv git build-essential -y

# Installing other pkg managers
nala install python3-pip npm flatpak -y

# Installing zsh
nala install zsh zsh-syntax-highlighting -y

# Installing java 
nala install openjdk-8-jdk openjdk-8-jre openjdk-17-jdk openjdk-17-jre -y

# Installing GUI programs 
nala install rpi-imager bleachbit sxiv timeshift mesa-utils transmission-gtk dconf-editor solaar virt-manager steam:i386 -y

# Installing a music player
nala install rhythmbox rhythmbox-plugins -y

# Installing media stuff
nala install yt-dlp mpv peek obs-studio kdenlive audacity gimp inkscape vlc -y

# Installing AwesomeWM Stuff
nala install variety awesome-doc awesome-extra qt5ct qt5-style-plugins xfce4-clipman xterm awesome pcmanfm alacritty rofi feh picom i3lock-fancy lxappearance arandr xclip xfce4-power-manager xbacklight flameshot network-manager-gnome lxpolkit volumeicon-alsa pavucontrol -y

# Rofi-Calc Script Depeninces
nala install rofi-dev qalc libtool -y

# Installing Browsers
nala purge firefox-esr
nala install firefox qutebrowser libjs-pdf -y

# Script Variables
username=$(id -u -n 1000)

# Installing fonts 
nala install fonts-font-awesome -y
mkdir -p /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Ubuntu.zip
unzip Ubuntu.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/SourceCodePro.zip
unzip SourceCodePro.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*

# Reloading cache
fc-cache -vf
# Removing zip files
rm ./FiraCode.zip ./Meslo.zip ./Ubuntu.zip ./SourceCodePro.zip

# Setting up ufw 
nala install ufw -y
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

# Starship Prompt
curl -sS https://starship.rs/install.sh | sh
