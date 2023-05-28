#!/bin/env bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

echo "##########################"
echo "## Making It Debian SID ##"
echo "##########################"
mv -v /etc/apt/sources.list /etc/apt/sources.list.bak
mv v sources.list /etc/apt/sources.list

echo "#########################"
echo "## Updating The System ##"
echo "#########################"
apt update
apt upgrade -y

echo "#####################"
echo "## Installing Nala ##"
echo "#####################"
apt install nala -y

echo "#######################"
echo "## CLI Nice To Haves ##"
echo "#######################"
nala install direnv yad fzf locate gh tree \
  build-essential git cmake make libhidapi-dev gpg openssl tldr \
  trash-cli g++ gcc wget curl python3 unzip tar python3-setuptools \
  autojump luarocks ranger shellcheck python3-venv meson \
  stow apt-transport-https qalc cmdtest qalc libtool ninja-build -y

echo "##################"
echo "## Wifi Manager ##"
echo "##################"
nala install network-manager -y

echo "##################"
echo "## Text Editors ##"
echo "##################"
nala install ripgrep fd-find neovim -y

echo "##################"
echo "## Pkg Managers ##"
echo "##################"
nala install npm flatpak golang-go python3-pip -y

echo "###############"
echo "## XDG Stuff ##"
echo "###############"
nala install xdg-user-dirs xdg-user-dirs-gtk -y

echo "###############"
echo "## Fun Stuff ##"
echo "###############"
nala install neofetch cowsay cmatrix tty-clock lolcat -y

echo "###############"
echo "## USB Utils ##"
echo "###############"
nala install udiskie udisks2 -y

echo "######################"
echo "## Resource Monitor ##"
echo "######################"
nala install btop htop bashtop -y

echo "############################"
echo "## Installing Shell Stuff ##"
echo "############################"
nala install zsh zsh-syntax-highlighting bash-completion -y

echo "#####################"
echo "## Installing Java ##"
echo "#####################"
nala install openjdk-11-jdk openjdk-11-jre openjdk-17-jdk openjdk-17-jre openjdk-8-jdk openjdk-8-jre -y

echo "#############################"
echo "## Installing GUI Programs ##"
echo "#############################"
nala install polybar galculator kitty bleachbit timeshift \
  transmission-gtk dconf-editor solaar virt-manager xinit sxhkd \
  arandr xterm xclip rofi-dev xbacklight xsel xdotool screenkey \
  rpi-imager steam:i386 -y

echo "############################"
echo "## Installing Media Stuff ##"
echo "############################"
nala install rhythmbox rhythmbox-plugins rhythmbox-data \
  playerctl pavucontrol yt-dlp mpv peek obs-studio kdenlive \
  audacity gimp vlc sxiv -y

echo "############################"
echo "## Installing Theme Stuff ##"
echo "############################"
nala install qt5ct qt5-style-plugins lxappearance -y

echo "###########################"
echo "## Installing File Stuff ##"
echo "###########################"
nala install gvfs thunar-archive-plugin thunar file-roller -y

echo "##################################"
echo "## Installing Things For Any WM ##"
echo "##################################"
nala install xwallpaper flameshot lxpolkit rofi i3lock-fancy -y

echo "#################################"
echo "## Installing Things For Picom ##"
echo "#################################"
nala install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev \
  libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev \
  libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev \
  libev-dev libx11-xcb-dev -y 

echo "################################"
echo "## Installing Window Managers ##"
echo "################################"
nala install awesome -y 

echo "#############################"
echo "## Installing Office Stuff ##"
echo "#############################"
nala install libreoffice zathura -y

echo "##########################"
echo "## Installing A Browser ##"
echo "##########################"
nala purge firefox -y
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
nala update
nala install brave-browser -y

echo "########################"
echo "## Installing Drivers ##"
echo "########################"
nala install mesa-utils -y

# Script Variables
username=$(id -u -n 1000)
builddir=$(pwd)

echo "######################"
echo "## Installing Fonts ##"
echo "######################"
nala install fonts-font-awesome fontconfig fonts-noto -y

echo "####################"
echo "## Installing UFW ##"
echo "####################"
nala install ufw -y
sleep 2.5
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable
systemctl enable ufw

echo "############"
echo "## Pfetch ##"
echo "############"
wget https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch 
chmod a+x pfetch
mv -v pfetch /usr/bin/

echo "#####################"
echo "## Starship Prompt ##"
echo "#####################"
curl -sS https://starship.rs/install.sh | sh
