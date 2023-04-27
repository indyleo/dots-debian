#!/bin/env bash

# Script Variables
builddir=$(pwd)

# Making directories & files 
mkdir -p ~/Github ~/Img ~/Applications ~/Zsh/Plugins ~/Pictures/Screenshots ~/Scripts ~/.icons ~/.themes ~/.cache/zsh ~/.local/bin ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Public ~/Videos
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

# Enveycontrol
cd ~/Github
git clone https://github.com/bayasdev/envycontrol.git
cd envycontrol
sudo pip install .
cd ~

# Shell Color Scripts
cd ~/Github
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
sudo make install
sudo cp completions/_colorscript /usr/share/zsh/site-functions
cd ~

# Greenclip
cd ~/.local/bin
wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
cd ~

# Pynvim
pip install pynvim

# Installing go stuff
go install github.com/jesseduffield/lazygit@latest github.com/xxxserxxx/gotop/v4/cmd/gotop@latest

# Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Installing lsd & bob
cargo install lsd bob-nvim

# Installing & Using Bobs Neovim
bob install stable
bob install 0.8.3
bob use 0.8.3

# Reload X11 Colors
cd $builddir
mv .Xresources ~/.Xresources
xrdb -load ~/.Xresources
cd ~

# Moving And Deletig And Adding Files
cd $builddir
git clone https://github.com/indyleo/Wallpapers.git ~/Pictures/Wallpapers/
mv  sxhkd polybar neofetch nvim ranger picom awesome conky alacritty rofi starship.toml mimeapps.list user-dirs.dirs greenclip.toml ~/.config/
rm ~/.bashrc ~/.profile
mv .bashrc .zshrc .zshenv .aliasrc .xsession .profile ~/

# Zsh Autopairs
cd ~/Zsh/Plugins
git clone https://github.com/hlissner/zsh-autopair.git
cd ~ 

# Zsh You Should Use
cd ~/Zsh/Plugins
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git
cd ~ 

# Zsh Completions
cd ~/Zsh/Plugins
git clone https://github.com/zsh-users/zsh-completions.git
cd ~

# Zsh History Substring Search
cd ~/Zsh/Plugins
git clone https://github.com/zsh-users/zsh-history-substring-search.git
cd ~

# Nordzy Cursors
cd ~/Github
git clone https://github.com/alvatip/Nordzy-cursors.git
cd Nordzy-cursors
./install.sh

# Papirus Icon Theme
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.icons" sh

# Nordic Theme
cd ~/.themes
git clone https://github.com/EliverLara/Nordic.git

# Rofi Power Menu
cd ~/Github
git clone https://github.com/jluttine/rofi-power-menu.git
cd rofi-power-menu
cp rofi-power-menu ~/.local/bin/
cd ~

# Nitch
wget https://raw.githubusercontent.com/unxsh/nitch/main/setup.sh
chmod a+x setup.sh
./setup.sh
rm setup.sh

# Flatpak Install
flatpak install com.github.tchx84.Flatseal com.brave.Browser com.bitwarden.desktop net.brinkervii.grapejuice org.prismlauncher.PrismLauncher xyz.xclicker.xclicker com.github.unrud.VideoDownloader 
