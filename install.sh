#!/bin/bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Update packages list and update system
pacman -Syu

# Installing CLI programs
pacman -S tty-clock libhidapi-dev yarn webpack gpg openssl tldr htop trash-cli neofetch neovim vim lolcat cmatrix cmake hidapi g++ cava wget python3 xdotool unzip python3-setuptools ripgrep fd-find luarocks go shellcheck git python3-venv --noconfirm

# Installing other pkg managers
pacman -S install python-pip npm cargo --noconfirm

# Installing zsh
pacman -S zsh zsh-syntax-highlighting --noconfirm

# Installindg openjdk
pacman -S jdk-openjdk	jre-openjdk jdk11-openjdk jre11-openjdk jdk17-openjdk jre17-openjdk jdk8-openjdk jre8-openjdk

# Installing GUI programs 
pacman -S mesa-utils peek transmission-gtk solaar virt-manager steam --noconfirm

# Installing KDE stuff
pacman -S elisa gwenview kcalc kaffeien juk kvantum-qt5 --noconfirm

# Script Variables
username=$(id -u -n 1000)

# Installing fonts 
pacman -S otf-font-awesome ttf-font-awesome --noconfirm
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
pacman -S ufw --noconfirm
sleep 2.5
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# Starship Prompt
curl -sS https://starship.rs/install.sh | sh
