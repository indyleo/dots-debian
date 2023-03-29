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

# Rustup
 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
 
# Installing lsd & bob-nvim
cargo install lsd bob-nvim

# Gotop
go install github.com/cjbassi/gotop@latest

# Stuff for neovim
pip install pynvim

# LazyGit
go install github.com/jesseduffield/lazygit@latest

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
mv -v .Xresources ~/.Xresources
xrdb -load ~/.Xresources
cd ~

# Gedit Nord Theme
cd ~/Github
git clone https://github.com/arcticicestudio/nord-gedit.git
cd nord-gedit
./install.sh
cd ~

# Zsh-Completions
cd ~/Zsh/Plugins
git clone https://github.com/zsh-users/zsh-completions.git
rm -f ~/.zcompdump; compinit
cd ~

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
mv -v Wallpapers ~/Pictures/
mv -v alacritty awesome conky neofetch nvim picom qutebrowser ranger rofi starship.toml mimeapps.list ~/.config/
rm -v ~/.bashrc
mv -v .bashrc .zshrc .aliasrc .xsession

# Flatpak Install
flatpak install com.brave.Browser com.bitwarden.desktop xyz.xclicker.xclicker com.github.unrud.VideoDownloader net.brinkervii.grapejuice
