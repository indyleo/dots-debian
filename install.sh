#!/bin/env bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Moving dnf.conf
#mv /etc/dnf/dnf.conf /etc/dnf/dnf.conf.bak
#mv dnf.conf /etc/dnf/dnf.conf

# Moving pacman.conf
#mv /etc/pacman.conf /etc/pacman.conf.bak
#mv pacman.conf /etc/pacman.conf

# Moving sources.list
#mv /etc/aptsources.list /etc/apt/sources.list.bak
#mv sources.list /etc/apt/sources.list

# Updating system
apt update -y
apt upgrade -y

# Intalling Nala
apt install nala

# Installing CLI programs
nala install direnv blueman bluez-tools yad fzf locate gh tree xsel build-essential git cmake libhidapi-dev \
  gpg openssl tldr trash-cli g++ gcc wget curl python3 xdotool unzip tar python3-setuptools autojump luarocks \
  ranger shellcheck python3-venv stow apt-transport-https -y

# Text Editor Stuff
nala install ripgrep fd-find neovim nano vim -y

# Installing other pkg managers
nala install python-pip npm flatpak golang-go -y

# XDG portals
nala install xdg-user-dirs xdg-user-dirs-gtk -y

# Installing fun stuff
nala install sl neofetch cowsay cmatrix tty-clock hollywood -y

# Mounting usb utils
nala install udiskie udisks2 -y

# Resoureces monitors
nala install btop htop bashtop -y

# Installing shell stuff
nala install zsh zsh-syntax-highlighting bash-completion -y

# Installing java 
nala install openjdk-11-jdk openjdk-11-jre openjdk-17-jdk openjdk-17-jre openjdk-8-jdk openjdk-8-jre -y

# Helpful Cmd To Gui Stuff
nala install gnupg ca-certificates gcc-multilib g++-multilib cmake libssl-dev  \
  pkg-config libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
  libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev \
  libxcursor-dev -y

# Installing GUI programs 
nala install polybar galculator rpi-imager alacritty kitty bleachbit timeshift transmission-gtk dconf-editor solaar virt-manager steam:i386 -y

# Installing a music player
nala install mpd mpc ncmpcpp -y

# Installing media stuff
nala install pavucontrol yt-dlp mpv peek obs-studio kdenlive audacity gimp inkscape vlc -y

# Installing image viewer
nala install sxiv -y

# Theme stuff
nala install qt5ct qt5-style-plugins lxappearance -y

# Installing file stuff 
nala install gvfs thunar-archive-plugin thunar file-roller -y

# Installing Awesome
nala install conky awesome picom flameshot lxpolkit rofi i3lock-fancy -y

# Installing Wallpaper Setters
nala install xwallpaper nitrogen feh -y 

# Installing Office
nala install libreoffice -y 

# Installing pdf reader
nala install zathura -y

# Installing browser
nala purge firefox-esr -y
rm -rf ~/.mozilla/
nala install firefox -y

# Installing X11 stuff
nala install xinit sxhkd xcowsay arandr xterm xclip xbacklight -y

# Installing glxgears
nala install mesa-utils -y

# Script Variables
username=$(id -u -n 1000)
builddir=$(pwd)

# Installing SDDM & Theme
#nala install sddm -y
#systemctl set-default graphical.target
#systemctl disabble gdm.service
#systemctl enable sddm.service
#mkdir -p /usr/share/sddm/themes
#tar -xzvf sugar-candy.tar.gz -C /usr/share/sddm/themes
#mv $builddir/sddm.conf /etc/sddm.conf

# Installing fonts 
nala install fonts-font-awesome fontconfig -y
mkdir -p /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraMono.zip
unzip FiraMono.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/SourceCodePro.zip
unzip SourceCodePro.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Ubuntu.zip
unzip Ubuntu.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/UbuntuMono.zip
unzip UbuntuMono.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
unzip JetBrainsMono.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/CascadiaCode.zip
unzip CascadiaCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/NerdFontsSymbolsOnly.zip
unzip NerdFontsSymbolsOnly.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*

# Reloading cache
fc-cache -vf

# Removing zip files
rm ./FiraCode.zip ./FiraMono.zip ./Meslo.zip ./SourceCodePro.zip ./Ubuntu.zip ./UbuntuMono.zip ./JetBrainsMono.zip ./CascadiaCode.zip ./NerdFontsSymbolsOnly.zip

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
