#!/bin/env bash

# Making directories & files 
mkdir -p ~/Github ~/Img ~/Applications ~/Pictures/Screenshots ~/Scripts ~/.icons ~/.themes ~/.cache/zsh ~/.cache/vim/undodir ~/.local/bin ~/Zsh/Plugins ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Public ~/Videos
touch ~/.cache/zsh/history 

# Pynvim
pip install pynvim

# Installing Cliphist (For Walyand)
go install go.senan.xyz/cliphist@latest

# Rofi PowerMenu
cd ~/Github
git clone https://github.com/jluttine/rofi-power-menu.git
cd rofi-power-menu
cp rofi-power-menu ~/.local/bin/
cd ~

# Rofi Settings
rofi -modi drun,window,run

# Reload X11 Colors
cd ~/dotfiles
mv .Xresources ~/.Xresources
xrdb -load ~/.Xresources
cd ~

# Installing yay AUR Helper (Needed)
cd ~/Github
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ~

# AUR Installing Some Programs
yay -Syu --noconfirm
yay -S rpi-imager-bin tty-clock zsh-you-should-use moar gotop-bin autojump envycontrol headsetcontrol shell-color-scripts pacseek vscodium-bin --noconfirm

# Moving And Deletig And Adding Files
cd ~/dotfiles
mv Wallpapers ~/Pictures/
mv alacritty kitty awesome conky neofetch nvim picom qutebrowser ranger rofi starship.toml mimeapps.list user-dirs.dirs ~/.config/
rm ~/.bashrc
mv .bashrc .zshrc .aliasrc .xsession ~/

# Nitch
wget https://raw.githubusercontent.com/unxsh/nitch/main/setup.sh
chmod a+x setup.sh
./setup.sh
rm setup.sh

# Flatpak Install
flatpak install com.github.tchx84.Flatseal com.brave.Browser com.bitwarden.desktop com.github.unrud.VideoDownloader net.brinkervii.grapejuice org.prismlauncher.PrismLauncher
