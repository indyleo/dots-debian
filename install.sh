#!/bin/env bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

#echo "########################"
#echo "## Making DNF Better ##"
#echo "########################"
#mv -v /etc/dnf/dnf.conf /etc/dnf/dnf.conf.bak
#mv -v dnf.conf /etc/dnf/dnf.conf

#echo "##########################"
#echo "## Making Pacman Better ##"
#echo "##########################"
#mv -v /etc/pacman.conf /etc/pacman.conf.bak
#mv -v pacman.conf /etc/pacman.conf

#echo "##########################"
#echo "## Making It Debian Sid ##"
#echo "##########################"
#mv -v /etc/apt/sources.list /etc/apt/sources.list.bak
#mv -v sources.list /etc/apt/sources.list

echo "#########################"
echo "## Updating The System ##"
echo "#########################"
apt update -y
apt upgrade -y

echo "#####################"
echo "## Installing Nala ##"
echo "#####################"
apt install nala -y

echo "#######################"
echo "## CLI Nice To Haves ##"
echo "#######################"
nala install direnv yad fzf locate gh tree \
  build-essential git cmake libhidapi-dev gpg openssl tldr \
  trash-cli g++ gcc wget curl python3  unzip tar \
  python3-setuptools autojump luarocks ranger shellcheck python3-venv \
  stow apt-transport-https qalc libtool cmdtest -y

echo "######################"
echo "## Bluetooth & Wifi ##"
echo "######################"
nala install blueman bluez-tools network-manager -y

echo "##################"
echo "## Text Editors ##"
echo "##################"
nala install ripgrep fd-find neovim -y

echo "##################"
echo "## Pkg Managers ##"
echo "##################"
nala install python-pip npm flatpak golang-go -y

echo "###############"
echo "## XDG Stuff ##"
echo "###############"
nala install xdg-user-dirs xdg-user-dirs-gtk -y

echo "###############"
echo "## Fun Stuff ##"
echo "###############"
nala install sl neofetch cowsay cmatrix tty-clock hollywood -y

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

echo "#################################"
echo "## Installing CLI-GUI Programs ##"
echo "#################################"
nala install gnupg ca-certificates gcc-multilib g++-multilib cmake libssl-dev  \
  pkg-config libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
  libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev \
  libxcursor-dev -y

echo "#############################"
echo "## Installing GUI Programs ##"
echo "#############################"
nala install polybar galculator rpi-imager kitty bleachbit timeshift \
  transmission-gtk dconf-editor solaar virt-manager xinit sxhkd xcowsay \
  arandr xterm xclip rofi-dev xbacklight steam:i386 xsel xdotool -y

echo "############################"
echo "## Installing Media Stuff ##"
echo "############################"
nala install rhythmbox rhythmbox-plugins rhythmbox-data \
  playerctl pavucontrol yt-dlp mpv peek obs-studio kdenlive \
  audacity gimp inkscape vlc sxiv -y

echo "############################"
echo "## Installing Theme Stuff ##"
echo "############################"
nala install qt5ct qt5-style-plugins lxappearance -y

echo "###########################"
echo "## Installing File Stuff ##"
echo "###########################"
nala install gvfs thunar-archive-plugin thunar file-roller -y

echo "###################################"
echo "## Installing Things For Awesome ##"
echo "###################################"
nala install awesome picom flameshot lxpolkit rofi i3lock-fancy -y

echo "###################################"
echo "## Installing Wallpaper Settings ##"
echo "###################################"
nala install xwallpaper nitrogen feh -y 

echo "#############################"
echo "## Installing Office Stuff ##"
echo "#############################"
nala install libreoffice zathura -y

echo "########################"
echo "## Installing FireFox ##"
echo "########################"
nala purge firefox-esr -y
rm -rf ~/.mozilla/
nala install firefox -y

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

echo "###########################"
echo "## Installing Nerd Fonts ##"
echo "###########################"
mkdir -pv /home/$username/.fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip
unzip -n FiraCode.zip -d /home/$username/.fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/SourceCodePro.zip
unzip -n SourceCodePro.zip -d /home/$username/.fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Ubuntu.zip
unzip -n Ubuntu.zip -d /home/$username/.fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/UbuntuMono.zip
unzip -n UbuntuMono.zip -d /home/$username/.fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/CascadiaCode.zip
unzip -n CascadiaCode.zip -d /home/$username/.fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/NerdFontsSymbolsOnly.zip
unzip -n NerdFontsSymbolsOnly.zip -d /home/$username/.fonts

echo "#####################################"
echo "## Changin Permissions Of ~/.fonts ##"
echo "#####################################"
chown -v $username:$username /home/$username/.fonts/
chown -v $username:$username /home/$username/.fonts/*

echo "##########################"
echo "## Reloading Font Cache ##"
echo "##########################"
fc-cache -vf

echo "###################################"
echo "## Removing Zip Files From Fonts ##"
echo "###################################"
rm -v ./FiraCode.zip ./FiraMono.zip ./Meslo.zip ./SourceCodePro.zip ./Ubuntu.zip ./UbuntuMono.zip ./JetBrainsMono.zip ./CascadiaCode.zip ./NerdFontsSymbolsOnly.zip

echo "###############################"
echo "## Installing UFW (Firewall) ##"
echo "###############################"
nala install ufw -y
sleep 2.5
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable
systemctl enable ufw

echo "########################"
echo "## Pfetch & NerdFetch ##"
echo "########################"
wget -q https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch
wget -q https://raw.githubusercontent.com/ThatOneCalculator/NerdFetch/master/nerdfetch 
chmod -v a+x nerdfetch pfetch
mv -v nerdfetch pfetch /usr/bin/

echo "#####################"
echo "## Starship Prompt ##"
echo "#####################"
curl -sS https://starship.rs/install.sh | sh
