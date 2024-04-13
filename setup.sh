#!/bin/bash

# Install Node.js using nvm
echo "Installing Node.js using nvm..."
sudo apt update
sudo apt install -y curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install --lts
echo "Node.js installed using nvm"

# Install tmux
echo "Installing tmux..."
sudo apt install -y tmux
echo "tmux installed"

# Install GDB
echo "Installing GDB (GNU Debugger)..."
sudo apt install -y gdb
echo "GDB installed"

# Install GDB Dashboard
echo "Installing GDB Dashboard..."
wget -P ~ https://github.com/cyrus-and/gdb-dashboard/raw/master/.gdbinit
echo "GDB Dashboard installed"

# Install Python and pip
echo "Installing Python and pip..."
sudo apt install -y python3 python3-pip
echo "Python and pip installed"

# Install Pygments
echo "Installing Pygments..."
pip install pygments
echo "Pygments installed"

# Set up Snap for Neovim
echo "Setting up Snap..."
sudo apt install -y snapd
sudo snap install nvim --classic
echo "Snap setup complete"

# Install Fish shell and Oh My Fish
echo "Installing Fish shell and Oh My Fish..."
sudo apt install -y fish git
curl -L https://get.oh-my.fish | fish
fish
echo "Fish shell and Oh My Fish installed"

# Disable Fish greeting
echo "Disabling Fish greeting..."
printf "function fish_greeting\nend" > ~/.config/fish/functions/fish_greeting.fish
echo "Fish greeting disabled"

# Set Fish as default shell
echo "Setting Fish as default shell..."
sudo chsh -s /usr/bin/fish $(whoami)
echo "Fish set as default shell"

# Install Starship
echo "Installing Starship..."
curl -fsSL https://starship.rs/install.sh | sh
echo "Starship installed"

# Configure Fish to use Starship
echo "Configuring Fish with Starship..."
echo "sh" >> ~/.config/fish/config.fish
echo "# ~/.config/fish/config.fish" >> ~/.config/fish/config.fish
echo "starship init fish | source" >> ~/.config/fish/config.fish
echo "Fish configured with Starship"

echo "Setup complete!"
