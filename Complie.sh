#!/bin/env bash

# Making directories & files 
mkdir -p ~/Github ~/Img ~/Applications ~/Pictures/Screenshots ~/Scripts ~/.icons ~/.themes ~/.cache/zsh ~/.cache/vim/undodir/ ~/.local/bin/ ~/Zsh/Plugins/
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

# Envycontrol
cd ~/Github
git clone https://github.com/bayasdev/envycontrol.git
cd envycontrol
sudo pip install .

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

# Rofi Settings
rofi -modi drun,window,run

# Reload X11 Colors
xrdb -load ~/.Xresources

# SDDM Theme
sudo mkdir ‑p /usr/share/sddm/themes
sudo tar -xzvf ~/Downloads/sugar-candy.tar.gz -C /usr/share/sddm/themes

# Zsh-Completions
git clone https://github.com/zsh-users/zsh-completions.git ~/Zsh/Plugins/
rm -f ~/.zcompdump; compinit

# Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Nvidia setting
sudo nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
