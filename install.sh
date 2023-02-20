#!/bin/bash

username=$(id -u -n 1000)

# Installing CLI programs
sudo dnf install gpg openssl tldr htop trash-cli neofetch neovim vim lolcat cmatrix cmake hidapi-devel g++ cava wget python3 xdotool unzip python3-setuptools ripgrep fd-find luarocks golang-go shellcheck -y

# Installing other pkg managers
sudo dnf install python3-pip npm -y


# Installing zsh
sudo dnf install zsh zsh-syntax-highlighting zsh-syntax-highlighting -y

# Installing GUI programs 
sudo dnf install peek transmission-gtk gnome-tweaks-tool dconf-editor solaar steam  -y

# Installing fonts 
mkdir -p ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d ~/.fonts
chown $username:$username /home/$username/.fonts/*
chown $username:$username /home/$username/.fonts/

# Reloading cache
fc-cache -vf
# Removing zip files
rm ./FiraCode.zip ./Meslo.zip

# Setting up ufw 
sudo dnf install ufw -y
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# Starship Prompt
curl -sS https://starship.rs/install.sh | sh

# Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
