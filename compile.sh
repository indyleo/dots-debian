#!/bin/env bash

# Script Variables
builddir=$(pwd)

echo "########################################"
echo "## Adding Some Directories, And Files ##"
echo "########################################"
mkdir -pv ~/Github ~/Img ~/Applications ~/Zsh/Plugins ~/Pictures/Screenshots ~/Scripts ~/.icons ~/.themes ~/.cache/zsh ~/.local/bin ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Public ~/Videos
touch ~/.cache/zsh/history 

echo "####################"
echo "## HeadsetControl ##"
echo "####################"
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
sudo cp completions/_colorscript /usr/share/zsh/site-functions
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
make install
cd ~

echo "################"
echo "## Moar Pager ##"
echo "################" 
wget https://github.com/walles/moar/releases/download/v1.13.0/moar-v1.13.0-linux-386 
chmod a+x moar-*-*-*
mv -v moar-*-*-* ~/.local/bin/moar

echo "#################"
echo "## Go Programs ##"
echo "#################" 
go install github.com/jesseduffield/lazygit@latest github.com/xxxserxxx/gotop/v4/cmd/gotop@latest

echo "##################"
echo "## Rust Install ##"
echo "##################" 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "##################"
echo "## Neovim Setup ##"
echo "##################"
~/.cargo/bin/cargo install bob-nvim
~/.cargo/bin/bob install stable
~/.cargo/bin/bob use stable

echo "########################################"
echo "## Moving, Deleting, And Adding Files ##"
echo "########################################"
mkdir -v ~/.config
cd $builddir
git clone https://github.com/indyleo/Wallpapers.git ~/Pictures/Wallpapers/
mv -v xfce4 sxhkd polybar Thunar neofetch nvim ranger picom awesome conky kitty rofi starship.toml mimeapps.list user-dirs.dirs greenclip.toml ~/.config/
rm -v ~/.bashrc ~/.profile ~/.zshenv
mv -v .bashrc .zshrc .zshenv .aliasrc .xsession .profile .xinitrc .Xresources ~/
mv -v $builddir/scripts/* ~/.local/bin/

echo "#################"
echo "## Zsh Plugins ##"
echo "#################" 
cd ~/Zsh/Plugins
git clone https://github.com/hlissner/zsh-autopair.git
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git
git clone https://github.com/zsh-users/zsh-completions.git
git clone https://github.com/zsh-users/zsh-history-substring-search.git
cd ~

echo "###################"
echo "## Cursors Theme ##"
echo "###################" 
cd ~/Github
git clone https://github.com/alvatip/Nordzy-cursors.git
cd Nordzy-cursors
./install.sh

echo "#################"
echo "## Icons Theme ##"
echo "#################" 
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.icons" sh

echo "###############"
echo "## GTK Theme ##"
echo "###############" 
cd ~/.themes
git clone https://github.com/EliverLara/Nordic.git

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
wget https://raw.githubusercontent.com/unxsh/nitch/main/setup.sh
chmod a+x setup.sh
./setup.sh
rm setup.sh

echo "##################"
echo "## Flatpak Repo ##"
echo "##################"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "#####################"
echo "## Flatpak Install ##"
echo "#####################"
flatpak install com.github.tchx84.Flatseal com.valvesoftware.Steam org.prismlauncher.PrismLauncher xyz.xclicker.xclicker org.nickvision.tubeconverter flathub com.discordapp.Discord
