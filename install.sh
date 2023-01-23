#!/bin/bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp /home/$username/Downloads/sources.list /etc/apt/sources.list

username=$(id -u -n 1000)
builddir=$(pwd)

# Enabling 32-bit packages
dpkg --add-architecture i386

# Update packages list and update system
apt update 
apt upgrade -y

# Install nala
apt install nala 

# Installing CLI programs
nala install gpg tldr htop autojump trash-cli neofetch neovim vim lolcat cmatrix build-essential git cmake libhidapi-dev gcc cava tty-clock wget python3 xdotool unzip python3-setuptools ripgrep fd-find python3-venv luarocks golang-go shellcheck -y

# Installing other pkg managers
nala install python3-pip pipx cargo npm -y

# Installing zsh
nala install zsh zsh-syntax-highlighting -y

# Installing java 
nala install openjdk-8-jdk openjdk-8-jre openjdk-17-jdk openjdk-17-jre -y

# Installing flatpack 
nala install flatpak gnome-software gnome-software-plugin-flatpak -y

# Installing drivers 
nala install nvidia-driver firmware-misc-nonfree mesa-utils -y

# Installing GUI programs 
nala install peek transmission-gtk gnome-tweaks dconf-editor alacritty solaar timeshift virt-manager winetricks gnome-shell-extensions gedit steam:i386  -y

# Installing a music player
nala install rhythmbox rhythmbox-plugins rhythmbox-plugin-cdrecorder -y

# Installing firefox
nala purge firefox-esr -y
nala install firefox -y

# Installing fonts 
nala install fonts-font-awesome -y
mkdir -p /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*

# Reloading cache
fc-cache -vf
# Removing zip files
rm ./FiraCode.zip ./Meslo.zip

# Setting up ufw 
nala install ufw -y
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# Starship Prompt
curl -sS https://starship.rs/install.sh | sh

# Nala 
printf " \n Run (sudo nala fetch) To Get Faster Speeds \n \n"
