#!/bin/sh

### Aliases and Varibels ###
username=$(id -u -n 1000)

### Updating System & Installing Programns###
apt update -y 
apt upgrade -y
# Installing Nala
apt install nala 
# Installing CLI Programs
nala install apt-transport-https curl neofetch ranger sl neovim vim zsh zsh-autosuggestions zsh-syntax-highlighting lolcat cmatrix hollywood build-essential git cmake libhidapi-dev gcc pip mesa-utils cowsay cava tty-clock npm cargo ufw fonts-font-awesome openjdk-8-jdk openjdk-8-jre openjdk-17-jdk openjdk-17-jre -y
# Installing GUI Programs
nala install rofi gnome-tweaks dconf-editor alacritty solaar virt-manager gnome-extensions timeshift -y
# Installing Brave Browser
sudo nala install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install brave-browser -y

### Setting Up UFW ###
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

### Making Directories & Files ###
mkdir -p ~/Github ~/Img ~/Applications ~/Scripts ~/.icons ~/.fonts ~/.themes ~/.cache/zsh
touch .cache/zsh/history

### Setting Up Fonts ###
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
mv dotfonts/fontawesome/otfs/*.otf /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*
# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

### Compiling Programs ###
cd ~/Github
# Headsetcontrol
git clone https://github.com/Sapd/HeadsetControl 
cd HeadsetControl
mkdir build
cd build
cmake ..
make
sudo make install
sudo udevadm control --reload-rules
sudo udevadm trigger
# Changing Back To The Github Directory
cd ~/Github
# Shell Color Script
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
sudo make install
# Changing Back To The Github Directory
cd ~/Github
# Fetch-Master-6000
wget https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/fm6000.pl -O fm6000
chmod +x fm6000
sudo mv fm6000 /usr/bin/
# Changing Back To The Github Directory
cd ~/Github
# Pfetch
wget https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch#
chmod +x pfetch
sudo mv pfetch /usr/bin/
# Changing Back To The Github Directory
cd ~/Github
# Envycontrol
git clone https://github.com/geminis3/envycontrol.git
cd envycontrol
sudo pip install .
# Changing Back To The Github Directory
cd ~/Github
# Yt-dlp
wget https://github.com/yt-dlp/yt-dlp/releases/download/2022.11.11/yt-dlp
sudo mv yt-dlp /usr/bin
# Changing Back To The Github Directory
cd ~/Github
# StarShip Prompt
curl -sS https://starship.rs/install.sh | sh
# Changing Back To The Home Directory
cd ~
### Nala ###
echo "Run (sudo nala fetch) To Get Faster Speeds"

