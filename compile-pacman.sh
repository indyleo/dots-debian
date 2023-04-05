#!/bin/env bash

# Making directories & files 
mkdir -p ~/Github ~/Img ~/Applications ~/Pictures/Screenshots ~/Scripts ~/.icons ~/.themes ~/.cache/zsh ~/.cache/vim/undodir ~/.local/bin ~/Zsh/Plugins ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Public ~/Videos
touch ~/.cache/zsh/history 

# Headsetcontrol
cd ~/Github
git clone https://github.com/Sapd/HeadsetControl 
cd HeadsetControl
mkdir build
cd build
cmake ..
make
sudo make install
sudo udevadm control --reload-rules
sudo udevadm trigger
cd ~

# Envycontrol
cd ~/Github
git clone https://github.com/bayasdev/envycontrol.git
cd envycontrol
sudo pip install .
cd ~

# Gotop & Lazygit
go install github.com/cjbassi/gotop@latest github.com/jesseduffield/lazygit@latest

# Pynvim
pip install pynvim

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
yay -S zsh-you-should-use moar gotop-bin autojump headsetcontrol --noconfirm

# Random Color Script
cd ~/Github
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
sudo make install
sudo cp completions/_colorscript /usr/share/zsh/site-functions
cd ~

# Nvidia Setting
sudo nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"

# Moving And Deletig And Adding Files
cd ~/dotfiles
mv Wallpapers ~/Pictures/
mv alacritty awesome conky neofetch nvim picom qutebrowser ranger rofi starship.toml mimeapps.list ~/.config/
rm ~/.bashrc
mv .bashrc .zshrc .aliasrc .xsession ~/

# Nitch
wget https://raw.githubusercontent.com/unxsh/nitch/main/setup.sh
chmod a+x setup.sh
./setup.sh

# Flatpak Install
flatpak install com.github.tchx84.Flatseal com.brave.Browser com.bitwarden.desktop com.github.unrud.VideoDownloader net.brinkervii.grapejuice org.prismlauncher.PrismLauncher
