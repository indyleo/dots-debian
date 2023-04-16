#!/bin/env bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Adding New Soureces.list

# Updating system
apt update -y
apt upgrade -y

# Intalling Nala
apt install nala

# Making Sure Chache Is Gone
dnf clean all

# Installing CLI programs
dnf install lsd blueman bluez-utils yad fzf locate gh tree xsel hidapi-devel gpg openssl tldr trash-cli neovim cmake g++ gcc wget curl python3 xdotool unzip tar python3-setuptools autojump luarocks ranger shellcheck python3-pytest-venv git -y

# Nvim Stuff
dnf install ripgrep fd-find -y

# Installing other pkg managers
dnf install cargo python-pip npm flatpak go -y

# Installing fun stuff
dnf install neofetch cmatrix tty-clock -y

# Resoureces monitors
dnf install btop htop -y

# XDG portals
dnf install xdg-user-dirs xdg-user-dirs-gtk -y

# Installing shell stuff
dnf install zsh zsh-syntax-highlighting bash-completion -y

# Installing java 
dnf install java-11-openjdk java-17-openjdk java-1.8.0-openjdk -y

# Installing GUI programs 
dnf install rpi-imager glava alacritty bleachbit timeshift transmission-gtk dconf-editor solaar virt-manager steam -y

# Installing a music player
dnf install rhythmbox -y

# Installing media stuff
dnf install yt-dlp mpv peek obs-studio kdenlive audacity gimp inkscape vlc -y

# Installing image viewer
dnf install sxiv -y

# Theme stuff
dnf install xfce4-settings qt5ct lxappearance -y

# Installing file stuff 
dnf install gvfs thunar-archive-plugin thunar file-roller -y

# Installing Awesome WM
dnf install conky awesome picom flameshot lxpolkit xfce4-clipman rofi i3lock-fancy volumeicon-alsa -y

# Installing X11 stuff
dnf install arandr xterm xclip xbacklight xwallpaper feh nitrogen -y

# Installing nvidia stuff
dnf install nvidia-settings nvidia-dkms nvidia-utils -y

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
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Ubuntu.zip
unzip Ubuntu.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/SourceCodePro.zip
unzip SourceCodePro.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*

# Reloading cache
fc-cache -vf

# Removing zip files
rm ./FiraCode.zip ./Meslo.zip ./SourceCodePro.zip ./Ubuntu.zip

# Setting up ufw 
dnf install ufw -y
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

# Screen Tearing Fix
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
