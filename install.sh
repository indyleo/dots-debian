#!/bin/env bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

echo "###################################"
echo "## Changing Debian To Debian SID ##"
echo "###################################"
rm -fv /etc/apt/sources.listt
mv -v sources.list /etc/apt/

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
  trash-cli g++ gcc wget curl python3 unzip tar lsd \
  python3-setuptools autojump luarocks ranger shellcheck python3-venv \
  stow apt-transport-https qalc cmdtest qalc libtool -y

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
nala install npm flatpak golang-go -y

echo "###############"
echo "## XDG Stuff ##"
echo "###############"
nala install xdg-user-dirs xdg-user-dirs-gtk -y

echo "###############"
echo "## Fun Stuff ##"
echo "###############"
nala install neofetch cowsay cmatrix tty-clock -y

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
  arandr xterm xclip rofi-dev xbacklight xsel xdotool screenkey -y

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
nala install xwallpaper picom flameshot lxpolkit rofi i3lock-fancy -y

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
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
nala update
nala install brave-browser -y

echo "########################"
echo "## Installing Drivers ##"
echo "########################"
nala install mesa-utils nvidia-driver firmware-misc-nonfree -y

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
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip
unzip -n FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Ubuntu.zip
unzip -n Ubuntu.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/UbuntuMono.zip
unzip -n UbuntuMono.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/CascadiaCode.zip
unzip -n CascadiaCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/NerdFontsSymbolsOnly.zip
unzip -n NerdFontsSymbolsOnly.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*

echo "##########################"
echo "## Reloading Font Cache ##"
echo "##########################"
fc-cache -vf

echo "###################################"
echo "## Removing Zip Files From Fonts ##"
echo "###################################"
rm -v ./FiraCode.zip ./Ubuntu.zip ./UbuntuMono.zip ./CascadiaCode.zip ./NerdFontsSymbolsOnly.zip

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
wget https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch
wget https://raw.githubusercontent.com/ThatOneCalculator/NerdFetch/master/nerdfetch 
chmod a+x nerdfetch pfetch
mv -v nerdfetch pfetch /usr/bin/

echo "#####################"
echo "## Starship Prompt ##"
echo "#####################"
curl -sS https://starship.rs/install.sh | sh
