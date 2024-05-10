#!/bin/bash

# Updating and Upgrading
echo "Updating and upgrading your system..."
sudo apt-get update && sudo apt-get upgrade -y

# Installing Snap Package Manager
echo "Installing Snap..."
sudo apt install snapd -y

# Install Neovim via Snap
echo "Installing Neovim..."
sudo snap install nvim --classic

# Install Fish Shell
echo "Installing Fish Shell..."
sudo apt install fish -y

# Change the default shell to fish
echo "Changing the default shell to Fish..."
chsh -s /usr/bin/fish

# Install Starship
echo "Installing Starship..."
curl -sS https://starship.rs/install.sh | sh

# Clone the configuration repository
echo "Cloning configuration repository..."
git clone https://github.com/smadi0x86/smadi0x86-DebianSysConfig.git
cd smadi0x86-DebianSysConfig

# Creating config directories (not needed if we are copying whole directories)
echo "Creating configuration directories..."
mkdir -p ~/.config

# Copy entire directories
echo "Copying configuration directories..."
cp -r .config/fish ~/.config/fish
cp -r .config/nvim ~/.config/nvim
cp -r .config/starship ~/.config/starship.toml

echo "Setup complete. Please restart your terminal for all changes to take effect."
