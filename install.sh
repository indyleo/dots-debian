#!/bin/env bash

set -euo pipefail
trap 'echo "Error occurred at line $LINENO"' ERR

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
    echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
    exit 1
fi

[[ -f /etc/apt/sources.list.bak ]] && rm -v /etc/apt/sources.list.bak 
[[ -f /etc/apt/sources.list ]] && mv -v /etc/apt/sources.list /etc/apt/sources.list.bak
[[ -f sources.list ]] && cp -v sources.list /etc/apt/sources.list

echo "#########################"
echo "## Updating The System ##"
echo "#########################"
apt update && apt upgrade -y

echo "#########################"
echo "## Installing Packages ##"
echo "#########################"
apt install -y \
    direnv yad fzf locate gh tree build-essential git cmake make libhidapi-dev gpg openssl tldr trash-cli g++ gcc wget curl \
    python3 unzip tar python3-setuptools zoxide luarocks lf shellcheck python3-venv meson stow apt-transport-https eza \
    qalc libtool libtool-bin ninja-build autoconf automake python3-pil bat flake8 jq poppler-utils odt2txt highlight catdoc \
    docx2txt genisoimage libimage-exiftool-perl libmagic-dev libmagic1 brightnessctl xbacklight libpam0g-dev libev-dev libx11-xcb1 \
    libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev \
    libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev \
    libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev libxext-dev meson ninja-build uthash-dev \
    zsh zsh-syntax-highlighting zsh-autosuggestions \
    network-manager network-manager-gnome network-manager-config-connectivity-debian \
    ripgrep fd-find neovim \
    npm flatpak golang-go python3-pip pipx \
    xdg-user-dirs xdg-user-dirs-gtk \
    cowsay cmatrix tty-clock lolcat fastfetch \
    udiskie udisks2 \
    htop \
    bash bash-completion \
    openjdk-17-jdk openjdk-17-jre gradle\
    transmission transmission-cli transmission-daemon transmission-gtk transmission-remote-gtk geoip-bin \
    polybar galculator alacritty bleachbit timeshift dconf-editor solaar virt-manager xinit sxhkd arandr xterm xclip rofi-dev xsel \
    xdotool xdo gedit gedit-plugins xorg xserver-xorg xserver-xephyr gparted \
    cava playerctl pamixer pavucontrol yt-dlp mpv peek vlc sxiv paprefs pulsemixer mediainfo ffmpegthumbnailer ffmpeg \
    qt5ct qt5-style-plugins lxappearance \
    thunar thunar-archive-plugin thunar-media-tags-plugin gvfs file-roller \
    mangohud vkbasalt goverlay \
    xwallpaper flameshot lxpolkit rofi i3lock-fancy xcowsay \
    awesome \
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
apt update && apt install -y floorp

# Install SDDM
echo "#####################"
echo "## Installing SDDM ##"
echo "#####################"
apt install -y sddm libqt5svg5 qml-module-qtquick-controls qml-module-qtquick-controls2
mkdir -p /usr/share/sddm/themes
tar -xzvf sugar-candy.tar.gz -C /usr/share/sddm/themes
mv sddm.conf /etc/sddm.conf
systemctl enable sddm.service
systemctl set-default graphical.target

echo "Done With Install"
