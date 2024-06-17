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
cargo install --git https://github.com/neovide/neovide.git
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
git clone https://gitlab.com/dwt1/wallpapers.git ~/Pictures/wallpapers/
mv -v xfce4 Thunar polybar neofetch git nvim lf awesome picom kitty rofi starship.toml mimeapps.list greenclip.toml user-dirs.locale user-dirs.dirs ~/.config/
mv -v desktopfiles/* ~/.local/share/applications
rm -v ~/.bashrc ~/.profile ~/.zshenv ~/.zshrc
mv -v .bashrc .profile .zshenv .zshrc .functionrc .aliasrc .xsession .Xresources ~/
mv -v "$builddir"/scripts ~/.local/
sudo mv -v "$builddir"/xsessionfiles/* /usr/share/xsessions

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
mkdir -v ~/.local/share/icons
cd ~/Github
git clone https://github.com/alvatip/Nordzy-cursors.git
cd Nordzy-cursors/themes
mv -v * ~/.local/share/icons
cd ~

echo "#################"
echo "## Icons Theme ##"
echo "#################" 
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.local/share/icons" sh
mv -v desktopfiles/* ~/.local/share/icons/Papirus-Dark/128x128/apps

echo "###############"
echo "## GTK Theme ##"
echo "###############" 
mkdir -v ~/.local/share/themes
cd ~/.local/share/themes
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
flatpak install com.obsproject.Studio io.github.arunsivaramanneo.GPUViewer org.fedoraproject.MediaWriter com.chatterino.chatterino net.lutris.Lutris org.ryujinx.Ryujinx com.github.tchx84.Flatseal com.valvesoftware.Steam org.prismlauncher.PrismLauncher com.heroicgameslauncher.hgl xyz.xclicker.xclicker org.nickvision.tubeconverter com.discordapp.Discord org.winehq.Wine com.usebottles.bottles net.davidotek.pupgui2
