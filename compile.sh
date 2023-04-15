#!/bin/env bash

# Script Variables
builddir=$(pwd)

# Making directories & files 
mkdir -p ~/Github ~/Img ~/Applications ~/Zsh/Plugins ~/Pictures/Screenshots ~/Scripts ~/.icons ~/.themes ~/.cache/zsh ~/.local/bin ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Public ~/Videos
touch ~/.cache/zsh/history 

# Pynvim
pip install pynvim

# Installing Cliphist
go install go.senan.xyz/cliphist@latest

# Installing yay AUR Helper
cd ~/Github
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ~

# AUR Installing Some Programs
yay -Syu --noconfirm
yay -S wlr-randr rpi-imager-bin tty-clock zsh-you-should-use moar gotop-bin autojump envycontrol headsetcontrol shell-color-scripts pacseek vscodium-bin --noconfirm

# Hyprland Stuff
yay -S xdg-desktop-portal-hyprland-git wlogout swaylock-effects waybar-hyprland --noconfirm

# Themes
yay -S nordic-theme papirus-icon-theme nordzy-cursors --noconfirm

# Reload X11 Colors
cd $builddir
mv .Xresources ~/.Xresources
xrdb -load ~/.Xresources
cd ~

# Moving And Deletig And Adding Files
cd $builddir
git clone https://github.com/indyleo/Wallpapers.git ~/Pictures/Wallpapers/
mv kitty neofetch nvim ranger picom awesome conky alacritty rofi starship.toml mimeapps.list user-dirs.dirs ~/.config/
rm ~/.bashrc
mv .bashrc .zshrc .aliasrc .xsession ~/

# Zsh Autopairs
cd ~/Zsh/Plugins
git clone https://github.com/hlissner/zsh-autopair.git
cd $builddir

# Nitch
wget https://raw.githubusercontent.com/unxsh/nitch/main/setup.sh
chmod a+x setup.sh
./setup.sh
rm setup.sh

# Flatpak Install
flatpak install com.github.tchx84.Flatseal com.brave.Browser com.bitwarden.desktop net.brinkervii.grapejuice org.prismlauncher.PrismLauncher xyz.xclicker.xclicker com.github.unrud.VideoDownloader 
