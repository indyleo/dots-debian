#!/bin/env bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Update packages list and update system
pacman -Syu

# Installing CLI programs
pacman -S blueman bluez-utils bluez brightnessctl udiskie udisks2 lazygit starship lsd autojump yad fzf locate gh tree xsel base-devel hidapi gpg openssl tldr trash-cli neovim cmake g++ gcc wget python3 xdotool unzip tar python3-setuptools ripgrep fd-find luarocks ranger golang-go shellcheck python3-venv git build-essential --noconfirm

# Installing doas
pacman -S doas --noconfirm

# Installing other pkg managers
pacman -S cargo python3-pip npm flatpak pacman-contrib --noconfirm

# Installing fun stuff
pacman -S neofetch cmatrix --noconfirm

# Resoureces monitors
pacman -S btop htop bashtop --noconfirm

# XDG portals
pacman -S xdg-user-dirs xdg-user-dirs-gtk --noconfirm

# Installing zsh
pacman -S zsh zsh-syntax-highlighting zsh-history-substring-search zsh-completions --noconfirm

# Installing java 
pacman -S jre11-openjdk jre17-openjdk jre8-openjdk jdk11-openjdk jdk8-openjdk jdk17-openjdk --noconfirm

# Installing GUI programs 
pacman -S kitty bleachbit timeshift transmission-gtk dconf-editor solaar virt-manager steam --noconfirm

# Installing a music player
pacman -S rhythmbox rhythmbox-plugins --noconfirm

# Installing media stuff
pacman -S yt-dlp mpv peek obs-studio kdenlive audacity gimp inkscape vlc --noconfirm

# Installing Hyprland and Walyand stuff
pacman -S xorg-xwayland grim wofi slurp polkit-gnome hyprland dunst qt5-wayland pamixer qt6-wayland swaybg swaylock network-manager-applet clipman --noconfirm

# Installing image viewer
pacman -S viewnior --noconfirm

# Theme stuff
pacman -S xfce4-settings qt5ct qt5-style-plugins lxappearance --noconfirm

# Installing file stuff 
pacman -S gvfs thunar-archive-plugin thunar file-roller --noconfirm

# Installing browser
pacman -S firefox --noconfirm

# Installing drivers
pacman -S libva linux-headers ×f86-video-amdgpu mesa-utils mesa lib32-mesa glu lib32-glu mesa-vdpau opencl-mesa vulkan-intel intel-ucode vulkan-mesa-layers vulkan-virtio --noconfirm

# Installing nvidia stuff
pacman -S nvidia-settings nvidia-dkms nvidia-utils --noconfirm

# Script Variables
username=$(id -u -n 1000)
builddir=$(pwd)

# Installing fonts 
pacman -S noto-fonts-extra noto-fonts-cjk noto-fonts-emoji otf-font-awesome ttf-ubuntu-font-family ttf-font-awesome awesome-terminal-fonts adobe-source-code-pro-fonts adobe-source-sans-fonts --noconfirm
mkdir -p /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/SourceCodePro.zip
unzip SourceCodePro.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*

# Moving doas.conf
mv ./doas.conf /etc/doas.conf

# Reloading cache
fc-cache -vf
# Removing zip files
rm ./FiraCode.zip ./Meslo.zip ./SourceCodePro.zip

# Setting up ufw 
pacman -S ufw --noconfirm
sleep 2.5
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable

# Installing SDDM & Theme
pacman -S sddm
systemctl set-defalut graphical.target
systemctl enable sddm
tar -xzvf sugar-candy.tar.gz -C /usr/share/sddm/themes
mv /home/$username/dotfiles/sddm.conf /etc/sddm.conf

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
