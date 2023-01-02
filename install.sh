#!/bin/bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list

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
nala install autojump trash-cli neofetch neovim vim lolcat cmatrix build-essential git cmake libhidapi-dev gcc cava tty-clock wget python3 xdotool unzip python3-setuptools python3-venv -y

# Installing other pkg managers
nala install python3-pip pipx cargo npm -y

# Installing zsh
nala install zsh zsh-syntax-highlighting -y

# Installing lsd
cargo install lsd

# Installing protontrix
pipx install protontricks

# Installing java 
nala install openjdk-8-jdk openjdk-8-jre openjdk-17-jdk openjdk-17-jre -y

# Installing flatpack 
nala install flatpak gnome-software gnome-software-plugin-flatpak -y

# Installing drivers 
nala install nvidia-driver firmware-misc-nonfree mesa-utils -y

# Installing GUI programs 
nala install transmission-gtk gnome-tweaks dconf-editor alacritty solaar timeshift virt-manager gnome-boxes steam:i386 winetricks gnome-shell-extensions gnome-shell-extension-manager -y

# Installing brave browser 
sudo nala install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install brave-browser -y

# Setting up fonts 
nala install fonts-font-awesome -y
mkdir -p /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts/*

# Reloading font
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

# nala 
printf " \n Run (sudo nala fetch) To Get Faster Speeds \n"
