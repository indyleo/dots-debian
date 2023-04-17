#!/bin/env bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Updating system
apt update -y
apt upgrade -y

# Installing CLI programs
apt install yad fzf locate gh tree xsel build-essential git cmake libhidapi-dev tldr trash-cli g++ gcc wget curl python3 unzip tar python3-setuptools autojump luarocks ranger shellcheck python3-venv -y

# Encytion tools
apt install gpg openssl -y

# Terminal mutiplexer
apt install tmux -y

# Nvim Stuff
apt install ripgrep fd-find neovim nano  -y

# Installing other pkg managers
apt install python-pip npm golang-go -y

# XDG portals
apt install xdg-user-dirs -y

# Installing fun stuff
apt install neofetch cmatrix tty-clock -y

# Resoureces monitors
nala install btop htop bashtop -y

# Installing shell stuff
nala install zsh zsh-syntax-highlighting bash-completion -y

# Installing java 
apt install openjdk-11-jdk openjdk-11-jre openjdk-17-jdk openjdk-17-jre openjdk-8-jdk openjdk-8-jre -y

# Installing media stuff
apt install yt-dlp -y

# Script Variables
username=$(id -u -n 1000)
builddir=$(pwd)

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

# Removing MOTD
rm /etc/motd

# Starship Prompt
curl -sS https://starship.rs/install.sh | sh
