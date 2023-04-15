#!/bin/env bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Update packages list and update system
pacman -Syu

# Installing CLI programs
pacman -S perl-file-mimeinfo glow blueman bluez-utils bluez brightnessctl udiskie udisks2 lazygit starship lsd yad fzf locate gh tree xsel base-devel hidapi gpg openssl tldr trash-cli neovim cmake g++ gcc wget curl python xdotool unzip tar python-setuptools ripgrep fd-find luarocks ranger shellcheck python-venv git build-essential --noconfirm

# Installing other pkg managers
pacman -S cargo python-pip npm flatpak pacman-contrib go --noconfirm

# Installing fun stuff
pacman -S neofetch cmatrix --noconfirm

# Resoureces monitors
pacman -S btop htop bashtop --noconfirm

# XDG portals
pacman -S xdg-user-dirs xdg-user-dirs-gtk --noconfirm

# Installing shell stuff
pacman -S zsh zsh-syntax-highlighting zsh-history-substring-search zsh-completions bash-completion --noconfirm

# Installing java 
pacman -S jre11-openjdk jre17-openjdk jre8-openjdk jdk11-openjdk jdk8-openjdk jdk17-openjdk --noconfirm

# Installing GUI programs 
pacman -S kitty alacritty bleachbit timeshift transmission-gtk dconf-editor solaar virt-manager steam --noconfirm

# Installing libreoffice
pacman -S libreoffice-fresh --noconfirm

# Installing a music player
pacman -S rhythmbox --noconfirm

# Installing media stuff
pacman -S yt-dlp mpv peek obs-studio kdenlive audacity gimp inkscape vlc --noconfirm

# Installing walyand stuff
pacman -S xorg-xwayland grim wofi slurp polkit-gnome dunst qt5-wayland pamixer qt6-wayland network-manager-applet clipman --noconfirm

# Installing hyprland
pacman -S hyprpaper hyprland swaylock swaybg --noconfirm

# Installing audio stuff
pacman -S wireplumber pipewire slurp --noconfirm

# Installing image viewer
pacman -S viewnior swayimg sxiv --noconfirm

# Theme stuff
pacman -S xfce4-settings qt5ct qt5-style-plugins lxappearance --noconfirm

# Installing file stuff 
pacman -S gvfs thunar-archive-plugin thunar file-roller --noconfirm

# Installing Awesome WM
pacman -S conky awesome picom flameshot lxsession xfce4-clipman rofi i3lock-fancy volumeicon-alsa --noconfirm

# Installing X11 stuff
pacman -S arandr xterm xclip xbacklight xwallpaper feh nitrogen --noconfirm

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
chown $username:$username /home/$username/.fonts/

# Installing nerd fonts
pacman -S otf-firamono-nerd ttf-ubuntu-mono-nerd ttf-ubuntu-nerd ttf-meslo-nerd ttf-sourcecodepro-nerd ttf-firacode-nerd ttf-nerd-fonts-symbols-common --noconfirm

# Reloading cache
fc-cache -vf

# Setting up ufw 
pacman -S ufw --noconfirm
sleep 2.5
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable
systemctl enable ufw

# Installing SDDM & Theme
pacman -S sddm --noconfirm
systemctl set-default graphical.target
systemctl enable sddm.service
tar -xzvf sugar-candy.tar.gz -C /usr/share/sddm/themes
mv /home/$username/dotfiles/sddm.conf /etc/sddm.conf

# Neovim Stuff
npm i -g neovim tree-sitter-cli
