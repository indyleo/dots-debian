#!/bin/sh

### Checking If Script Is Run With Sudo Privalages ###
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

### Varibels ###
username=$(id -u -n 1000)

### Enabling 32-bit Architecture For Packages ###
dpkg --add-architecture i386

### Updating System ###
apt update 
apt upgrade -y

### Installing Nala ###
apt install nala 

### Installing CLI Programs ###
nala install trash-cli neofetch ranger sl neovim vim zsh zsh-autosuggestions zsh-syntax-highlighting lolcat cmatrix hollywood build-essential git cmake libhidapi-dev gcc pip mesa-utils cowsay cava tty-clock npm cargo ufw fonts-font-awesome openjdk-8-jdk openjdk-8-jre openjdk-17-jdk openjdk-17-jre apt-transport-https curl python3-pip python3-setuptools python3-venv pipx winetricks -y

### Installing LSD ###
cargo install lsd

### Installing Protontrix & Protonup ###
pipx install protontricks

### Installing GUI Programs ###
nala install rofi gnome-tweaks dconf-editor alacritty solaar virt-manager thunar gnome-extensions timeshift rpi-imager pavucontrol steam -y

### Installing Flatpack ###
nala install flatpak gnome-software gnome-software-plugin-flatpak -y

### Installing Drivers ###
nala install nvida-driver firmware-misc-nonfree -y

### Installing Brave Browser ###
sudo nala install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install brave-browser -y

### Making Directories & Files ###
mkdir -p ~/github ~/img ~/Applications ~/scripts ~/.icons ~/.fonts ~/.themes ~/.cache/zsh
touch .cache/zsh/history

### Setting Up Fonts ###
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts/*

# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

### Compiling Programs ###
cd ~/github

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
cd ~/github

# Shell Color Script
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
sudo make install

# Changing Back To The Github Directory
cd ~/github

# Fetch-Master-6000
wget https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/fm6000.pl -O fm6000
chmod +x fm6000
sudo mv fm6000 /usr/bin/

# Changing Back To The Github Directory
cd ~/github

# Pfetch
wget https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch#
chmod +x pfetch
sudo mv pfetch /usr/bin/

# Changing Back To The Github Directory
cd ~/github

# Envycontrol
git clone https://github.com/geminis3/envycontrol.git
cd envycontrol
sudo pip install .

# Changing Back To The Github Directory
cd ~/github

# Yt-dlp
wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
sudo mv yt-dlp /usr/bin/

# Changing Back To The Github Directory
cd ~/github

# StarShip Prompt
curl -sS https://starship.rs/install.sh | sh

# Changing Back To The Home Directory
cd ~

### Setting Up UFW ###
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

### Nala ###
printf " \n Run (sudo nala fetch) To Get Faster Speeds"

### Adding Flathub Repo ###
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

