#!/bin/bash
# Improved and Secured Script #

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

sudo apt update
sudo apt upgrade -y

if ! command -v curl &> /dev/null; then
    echo "curl is not installed. Installing curl..."
    sudo apt install curl
fi

install_package() {
    local package_url=$1
    local package_name=$(basename "$package_url")
    
    sudo curl -fsSLo "/tmp/$package_name" "$package_url"
    
    sudo apt install "/tmp/$package_name"
    
    rm "/tmp/$package_name"
}

# Install MegaCMD
mega_cmd_url="https://mega.nz/linux/repo/Debian_12/amd64/megacmd-Debian_12\
		_amd64.deb"
install_package "$mega_cmd_url"

# Install Brave Browser
brave_key_url="https://brave-browser-apt-release.s3.brave.com/brave-browser-\
		archive-keyring.gpg"
sudo curl -fsSLo "/usr/share/keyrings/brave-browser-archive-keyring.gpg" \
		  "$brave_key_url"

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] \
	https://brave-browser-apt-release.s3.brave.com/ stable main" 
	| sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# Install other packages
packages=("neofetch" "build-essential" "keepassxc" "vim-gtk3" "cscope" 
	    "fonts-dejavu" "gnome-icon-theme" "vim-doc" "gh" "git")
for package in "${packages[@]}"; do
    sudo apt install "$package"
done

