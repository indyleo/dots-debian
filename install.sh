#!/bin/env bash

set -euo pipefail
trap 'echo "Error occurred at line $LINENO"' ERR

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
    echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
    exit 1
fi

mv -v /etc/apt/sources.list /etc/apt/sources.list.bak
mv -v sources.list /etc/apt/sources.list

echo "#########################"
echo "## Updating The System ##"
echo "#########################"
apt update && apt upgrade -y

echo "#####################"
echo "## Installing Nala ##"
echo "#####################"
apt install -y nala

echo "#########################"
echo "## Installing Packages ##"
echo "#########################"
nala install -y \
    direnv yad fzf locate gh tree build-essential git cmake make libhidapi-dev gpg openssl tldr trash-cli g++ gcc wget curl \
    python3 unzip tar python3-setuptools zoxide luarocks lf shellcheck python3-venv meson eza stow apt-transport-https cmdtest \
    qalc libtool libtool-bin ninja-build autoconf automake python3-pil bat flake8 jq poppler-utils odt2txt highlight catdoc \
    docx2txt genisoimage libimage-exiftool-perl libmagic-dev libmagic1 brightnessctl xbacklight libpam0g-dev \
    zsh zsh-syntax-highlighting zsh-autosuggestions \
    network-manager network-manager-gnome network-manager-config-connectivity-debian \
    ripgrep fd-find neovim \
    npm flatpak golang-go python3-pip pipx \
    xdg-user-dirs xdg-user-dirs-gtk \
    fastfetch cowsay cmatrix tty-clock lolcat \
    udiskie udisks2 \
    htop \
    bash bash-completion \
    openjdk-8-jdk openjdk-8-jre openjdk-17-jdk openjdk-17-jre openjdk-21-jdk openjdk-21-jre gradle\
    transmission transmission-cli transmission-daemon transmission-gtk transmission-remote-gtk geoip-bin \
    polybar galculator alacritty bleachbit timeshift dconf-editor solaar piper virt-manager xinit sxhkd arandr xterm xclip rofi-dev xsel \
    xdotool xdo gedit gedit-plugins xorg xserver-xorg xserver-xephyr xautolock gparted \
    cava playerctl pamixer pavucontrol yt-dlp mpv peek vlc sxiv paprefs pulsemixer mediainfo ffmpegthumbnailer ffmpeg \
    qt5ct qt5-style-plugins lxappearance \
    thunar thunar-archive-plugin thunar-media-tags-plugin gvfs file-roller \
    mangohud vkbasalt goverlay \
    xwallpaper flameshot lxpolkit rofi i3lock-fancy xcowsay \
    awesome qtile \
    libreoffice zathura \
    mesa-utils nvidia-driver nvidia-cuda-toolkit nvidia-cuda-samples firmware-misc-nonfree \
    fonts-font-awesome fontconfig fonts-noto fonts-ubuntu fonts-jetbrains-mono \
    ufw

# Configure Firewall
echo "####################"
echo "## Configuring UFW ##"
echo "####################"
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable
systemctl enable ufw

# Install Floorp Browser
echo "##########################"
echo "## Installing Floorp ##"
echo "##########################"
curl -fsSL https://ppa.floorp.app/KEY.gpg | gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list 'https://ppa.floorp.app/Floorp.list'
nala update && nala install -y floorp

# Install SDDM
echo "#####################"
echo "## Installing SDDM ##"
echo "#####################"
nala install -y sddm libqt5svg5 qml-module-qtquick-controls qml-module-qtquick-controls2
nala purge -y kded5
mkdir -p /usr/share/sddm/themes
tar -xzvf sugar-candy.tar.gz -C /usr/share/sddm/themes
mv sddm.conf /etc/sddm.conf
systemctl enable sddm.service
systemctl set-default graphical.target

echo "Done With Install"
