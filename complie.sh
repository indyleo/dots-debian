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

# Gedit Nord Theme
cd ~/Github
git clone https://github.com/arcticicestudio/nord-gedit.git
cd nord-gedit
./install.sh
cd ~

# Zsh Completions
cd ~/Zsh/Plugins
git clone https://github.com/zsh-users/zsh-completions.git
rm -f ~/.zcompdump; compinit
cd ~

# Zsh You Should Use
cd ~/Zsh/Plugins
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git
cd ~

# Zsh History Substring Search
cd ~/Zsh/Plugins
it clone https://github.com/zsh-users/zsh-history-substring-search.git
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
mv Wallpapers ~/Pictures/
mv alacritty awesome conky neofetch nvim picom qutebrowser ranger rofi starship.toml mimeapps.list ~/.config/
rm ~/.bashrc
mv .bashrc .zshrc .aliasrc .xsession

# Flatpak Install
flatpak install com.github.tchx84.Flatseal com.brave.Browser com.bitwarden.desktop xyz.xclicker.xclicker com.github.unrud.VideoDownloader net.brinkervii.grapejuice org.prismlauncher.PrismLauncher
