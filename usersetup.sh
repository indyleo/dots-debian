#!/bin/env bash

set -euo pipefail  # Exit on error

# Script Variables
builddir=$(pwd)

# Function to create directories
create_dirs() {
    echo "########################################"
    echo "## Adding Some Directories, And Files ##"
    echo "########################################"
    mkdir -pv ~/Github ~/Img ~/Virt ~/Projects ~/Applications \
        ~/Pictures/Screenshots ~/Scripts ~/.local/bin ~/.local/scripts ~/Desktop \
        ~/Documents ~/Documents/Markdown ~/Downloads ~/Music \
        ~/Pictures ~/Public ~/Videos/OBS ~/.config/autostart ~/.cache
    touch ~/.cache/history-zsh
}

create_dirs

# Function to clone repositories
git_clone() {
    local repo="$1"
    local dest="$2"
    [ -d "$dest" ] || git clone --depth=1 "$repo" "$dest"
}

# Clone repositories
git_clone https://github.com/bayasdev/envycontrol.git ~/Github/envycontrol
git_clone https://github.com/FT-Labs/picom.git ~/Github/picom
git_clone https://github.com/indyleo/scripts.git ~/.local/scripts

echo "######################"
echo "## Picom Animations ##"
echo "######################"
cd ~/Github/picom
git submodule update --init --recursive
meson setup --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ~

echo "#################"
echo "## Go Programs ##"
echo "#################"
go install github.com/doronbehar/pistol/cmd/pistol@latest
go install github.com/charmbracelet/glow@latest

echo "#####################"
echo "## Python Programs ##"
echo "#####################"
pipx installl spotdl

echo "############"
echo "## Rustup ##"
echo "############"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.profile

echo "###################"
echo "## Rust Programs ##"
echo "###################"
cargo install bob-nvim 
bob install stable
bob use stable

echo "##################"
echo "## Oh My Posh ##"
echo "##################"
curl -s https://ohmyposh.dev/install.sh | bash -s

# Function to download and extract fonts
download_font() {
    local font_name="$1"
    wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/${font_name}.zip"
    unzip -n "${font_name}.zip" -d ~/.local/share/fonts
    rm -v "${font_name}.zip"
    echo "Donw with ${font_name}"
}

echo "###########################"
echo "## Installing Nerd Fonts ##"
echo "###########################"
mkdir -pv ~/.local/share/fonts
download_font "FiraCode"
download_font "Ubuntu"
download_font "UbuntuMono"
download_font "CascadiaCode"
download_font "NerdFontsSymbolsOnly"

fc-cache -vf

echo "########################################"
echo "## Moving, Deleting, And Adding Files ##"
echo "########################################"
mkdir -pv ~/.config
git_clone https://github.com/indyleo/Wallpapers.git ~/Pictures/Wallpapers/
git_clone https://gitlab.com/dwt1/wallpapers.git ~/Pictures/wallpapers/
mv -v xfce4 Thunar polybar fastfetch git nvim lf awesome alacritty rofi ohmyposh mimeapps.list greenclip.toml user-dirs.locale user-dirs.dirs ~/.config/
rm -v ~/.bashrc ~/.profile ~/.zshenv ~/.zshrc
mv -v .profile .zshenv .zshrc .functionrc .aliasrc .xsession .Xresources ~/
sudo mv -v "$builddir"/xsessionfiles/* /usr/share/xsessions

# Zsh Plugins
echo "#################"
echo "## Zsh Plugins ##"
echo "#################"
mkdir -pv ~/Zsh-Plugins
git_clone https://github.com/zsh-users/zsh-history-substring-search.git ~/Zsh-Plugins/zsh-history-substring-search
git_clone https://github.com/zsh-users/zsh-completions.git ~/Zsh-Plugins/zsh-completions
git_clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/Zsh-Plugins/zsh-you-should-use
git_clone https://github.com/hlissner/zsh-autopair.git ~/Zsh-Plugins/zsh-autopair

# Add user to libvirt group
sudo usermod -aG libvirt "$(whoami)"

# Cursor Theme
echo "###################"
echo "## Cursors Theme ##"
echo "###################"
git_clone https://github.com/alvatip/Nordzy-cursors.git ~/Github/Nordzy-cursors
mv -v ~/Github/Nordzy-cursors/themes/* ~/.local/share/icons

# Icons Theme
echo "#################"
echo "## Icons Theme ##"
echo "#################"
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.local/share/icons" sh
mv -v desktopfiles/* ~/.local/share/icons/Papirus-Dark/128x128/apps

# GTK Theme
echo "###############"
echo "## GTK Theme ##"
echo "###############"
mkdir -pv ~/.local/share/themes
git_clone https://github.com/EliverLara/Nordic.git ~/.local/share/themes/Nordic
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

# Gedit Theme
echo "#################"
echo "## Gedit Theme ##"
echo "#################"
git_clone https://github.com/nordtheme/gedit.git ~/Github/gedit
cd ~/Github/gedit
./install.sh
cd ~

# Greenclip
echo "###############"
echo "## Greenclip ##"
echo "###############"
wget -q -O ~/.local/bin/greenclip https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
chmod a+x ~/.local/bin/greenclip

# Flatpak Setup
echo "##################"
echo "## Flatpak Repo ##"
echo "##################"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "#####################"
echo "## Flatpak Install ##"
echo "#####################"
flatpak install -y io.github.dweymouth.supersonic com.obsproject.Studio io.github.arunsivaramanneo.GPUViewer org.fedoraproject.MediaWriter com.chatterino.chatterino net.lutris.Lutris com.github.tchx84.Flatseal com.valvesoftware.Steam org.prismlauncher.PrismLauncher com.heroicgameslauncher.hgl xyz.xclicker.xclicker dev.vencord.Vesktop org.winehq.Wine com.usebottles.bottles net.davidotek.pupgui2

echo "Setup complete!"
