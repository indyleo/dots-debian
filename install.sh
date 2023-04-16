#!/bin/env bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Updating system
apt update -y
apt upgrade -y

# Intalling Nala
apt install nala

# Installing CLI programs
dnf install lsd blueman bluez-utils yad fzf locate gh tree xsel hidapi gpg openssl tldr trash-cli neovim cmake g++ gcc wget curl python3 xdotool unzip tar python-setuptools autojump luarocks ranger shellcheck python-venv git -y

# Nvim Stuff
nala install ripgrep fd-find -y

# Installing other pkg managers
nala install cargo python-pip npm flatpak golang-go -y

# Installing fun stuff
dnf install neofetch cmatrix tty-clock -y

# Resoureces monitors
dnf install btop htop -y

# XDG portals
dnf install xdg-user-dirs xdg-user-dirs-gtk -y

# Installing shell stuff
nala install zsh zsh-syntax-highlighting bash-completion -y

# Installing java 
nala install java-11-openjdk java-17-openjdk java-1.8.0-openjdk -y

# Installing GUI programs 
nala install rpi-imager alacritty bleachbit timeshift transmission-gtk dconf-editor solaar virt-manager steam -y

# Installing a music player
nala install rhythmbox rhythombox-plugins -y

# Installing media stuff
nala install yt-dlp mpv peek obs-studio kdenlive audacity gimp inkscape vlc -y

# Installing image viewer
nala install sxiv -y

# Theme stuff
nala install qt5ct lxappearance -y

# Installing file stuff 
nala install gvfs thunar-archive-plugin thunar file-roller -y

# Installing Awesome
nala install conky awesome picom flameshot lxpolkit xfce4-clipman rofi i3lock-fancy volumeicon-alsa -y

# Installing X11 stuff
nala install arandr xterm xclip xbacklight xwallpaper feh nitrogen -y

# Installing glxgears
nala install mesa-utils

# Script Variables
username=$(id -u -n 1000)
builddir=$(pwd)

# Installing fonts 
dnf install fontawesome-fonts-web fontawesome-fonts -y
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
nala install ufw -y
sleep 2.5
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable
systemctl enable ufw

# Installing SDDM & Theme
dnf install sddm -y
systemctl set-default graphical.target
systemctl diable gdm3.service
systemctl enable sddm.service
tar -xzvf sugar-candy.tar.gz -C /usr/share/sddm/themes
mv $builddir/sddm.conf /etc/sddm.conf

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

# Starship Prompt
curl -sS https://starship.rs/install.sh | sh
