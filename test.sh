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

# Creating config directories
echo "Creating configuration directories..."
mkdir -p ~/.config/fish
mkdir -p ~/.config/nvim
mkdir -p ~/.config/starship

# Copy config files
echo "Copying configuration files..."
cp .config/fish/config.fish ~/.config/fish/config.fish
cp .config/nvim/init.lua ~/.config/nvim/init.lua
cp .config/starship/starship.toml ~/.config/starship/starship.toml

echo "Setup complete. Please restart your terminal for all changes to take effect."
