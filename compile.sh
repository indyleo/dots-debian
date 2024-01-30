#!/bin/env bash

# Script Variables
builddir=$(pwd)

echo "########################################"
echo "## Adding Some Directories, And Files ##"
echo "########################################"
mkdir -pv ~/Github ~/Img ~/Virt ~/Projects ~/Applications ~/Pictures/Screenshots ~/Scripts ~/.local/bin ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Public ~/Videos/OBS
touch ~/.cache/history-bash ~/.cache/history-zsh

echo "#################"
echo "## Envycontrol ##"
echo "#################"
cd ~/Github
git clone https://github.com/bayasdev/envycontrol.git
cd ~

echo "#########################"
echo "## Shell Color Scripts ##"
echo "#########################" 
cd ~/Github
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
sudo make install
cd ~

echo "################"
echo "## Rofi Emoji ##"
echo "################" 
cd ~/Github
git clone https://github.com/Mange/rofi-emoji.git
cd rofi-emoji
autoreconf -i
mkdir build
cd build/
../configure
make
sudo make install
cd ~

echo "###############"
echo "## Rofi Calc ##"
echo "###############" 
cd ~/Github
git clone https://github.com/svenstaro/rofi-calc.git
cd rofi-calc
mkdir m4
autoreconf -i
mkdir build
cd build/
../configure
make
sudo make install
cd ~

echo "######################"
echo "## Picom Animations ##"
echo "######################"
cd ~/Github
git clone https://github.com/FT-Labs/picom.git
cd picom
git submodule update --init --recursive
meson setup --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ~

echo "#############"
echo "## Bashtop ##"
echo "#############"
cd ~/Github
git clone https://github.com/aristocratos/bashtop.git
cd bashtop
sudo make install
cd ~

echo "#################"
echo "## Go Programs ##"
echo "#################" 
go install github.com/charmbracelet/glow@latest github.com/doronbehar/pistol/cmd/pistol@latest github.com/xxxserxxx/gotop/v4/cmd/gotop@latest

echo "############"
echo "## Rustup ##"
echo "############" 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "##################"
echo "## Neovim Setup ##"
echo "##################" 
cargo install bob-nvim
bob install stable
bob use stable

echo "###########################"
echo "## Installing Nerd Fonts ##"
echo "###########################"
mkdir -pv ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
unzip -n FiraCode.zip -d ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Ubuntu.zip
unzip -n Ubuntu.zip -d ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/UbuntuMono.zip
unzip -n UbuntuMono.zip -d ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
unzip -n CascadiaCode.zip -d ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.zip
unzip -n NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts

echo "##########################"
echo "## Reloading Font Cache ##"
echo "##########################"
fc-cache -vf

echo "###################################"
echo "## Removing Zip Files From Fonts ##"
echo "###################################"
rm -v ./FiraCode.zip ./Ubuntu.zip ./UbuntuMono.zip ./CascadiaCode.zip ./NerdFontsSymbolsOnly.zip

echo "########################################"
echo "## Moving, Deleting, And Adding Files ##"
echo "########################################"
mkdir -v ~/.config
cd "$builddir"
git clone https://github.com/indyleo/Wallpapers.git ~/Pictures/Wallpapers/
mv -v xfce4 Thunar polybar neofetch git nvim lf awesome picom kitty rofi starship.toml mimeapps.list greenclip.toml ~/.config/
rm -v ~/.bashrc ~/.profile ~/.zshenv ~/.zshrc
mv -v .bashrc .profile .zshenv .zshrc .functionrc .aliasrc .xsession .Xresources ~/
mv -v "$builddir"/scripts ~/.local/

echo "#################"
echo "## Zsh Plugins ##"
echo "#################"
mkdir -v ~/Zsh-Plugins
cd ~/Zsh-Plugins
git clone https://github.com/zsh-users/zsh-history-substring-search.git
git clone https://github.com/zsh-users/zsh-completions.git
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git
git clone https://github.com/hlissner/zsh-autopair.git
cd ~

# adding ur usr to libvirt group
sudo usermod -aG libvirt "$(whoami)"

echo "###################"
echo "## Cursors Theme ##"
echo "###################" 
mkdir -v ~/.icons
cd ~/Github
git clone https://github.com/alvatip/Nordzy-cursors.git
cd Nordzy-cursors
./install.sh
cd ~

echo "#################"
echo "## Icons Theme ##"
echo "#################" 
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.icons" sh

echo "###############"
echo "## GTK Theme ##"
echo "###############" 
mkdir -v ~/.themes
cd ~/.themes
git clone https://github.com/EliverLara/Nordic.git
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
cd ~

echo "#################"
echo "## Gedit Theme ##"
echo "#################"
cd ~/Github
git clone https://github.com/nordtheme/gedit.git
cd gedit
./install.sh
cd ~

echo "###############"
echo "## Greenclip ##"
echo "###############"
cd ~/.local/bin
wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
chmod a+x greenclip 
cd ~

echo "###########"
echo "## Nitch ##"
echo "###########"
cd ~
wget https://raw.githubusercontent.com/unxsh/nitch/main/setup.sh 
chmod a+x ./setup.sh
./setup.sh
rm -f ./setup.sh

echo "##################"
echo "## Flatpak Repo ##"
echo "##################"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "#####################"
echo "## Flatpak Install ##"
echo "#####################"
flatpak install com.obsproject.Studio io.github.arunsivaramanneo.GPUViewer org.fedoraproject.MediaWriter com.chatterino.chatterino net.brinkervii.grapejuice net.lutris.Lutris org.yuzu_emu.yuzu com.github.tchx84.Flatseal com.valvesoftware.Steam org.prismlauncher.PrismLauncher com.heroicgameslauncher.hgl xyz.xclicker.xclicker org.nickvision.tubeconverter com.discordapp.Discord org.winehq.Wine com.usebottles.bottles net.davidotek.pupgui2
