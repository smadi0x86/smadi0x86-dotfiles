#!/bin/bash

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt-get update && sudo apt-get upgrade -y

# Install AWS CLI
echo "Installing AWS CLI..."
sudo apt-get install awscli -y

# Install Azure CLI
echo "Installing Azure CLI..."
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install Terraform
echo "Installing Terraform..."
sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform -y

# Install Kubernetes CLI (kubectl)
echo "Installing Kubernetes CLI..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Install Helm
echo "Installing Helm..."
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Install Ansible
echo "Installing Ansible..."
sudo apt-get update && sudo apt-get install -y ansible

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

# Install Fisher and plugins for Fish shell
echo "Installing Fisher and plugins for Fish shell..."
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install edc/bass
echo "Fisher and plugins installed"

# Create and configure nvm.fish for Fish shell
echo "Creating and configuring nvm.fish..."
sudo nano ~/.config/fish/functions/nvm.fish
# Add the following code to the file nvm.fish
echo "function nvm" > ~/.config/fish/functions/nvm.fish
echo "    bass source ~/.nvm/nvm.sh --no-use ';' nvm \$argv" >> ~/.config/fish/functions/nvm.fish
echo "end" >> ~/.config/fish/functions/nvm.fish
echo "nvm.fish created and configured"

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

# Copy files from smadi0x86-setup to appropriate directories
echo "Copying files to appropriate directories..."
cp ~/smadi0x86-setup/.bashrc ~/
cp ~/smadi0x86-setup/.gitconfig ~/
cp ~/smadi0x86-setup/.tmux.conf ~/
cp ~/smadi0x86-setup/.config/starship.toml ~/.config/
cp -r ~/smadi0x86-setup/.tmux/plugins ~/.tmux/
echo "Files copied"

echo "Don't forget to install and add the font: https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/NoLigatures/SemiBold/JetBrainsMonoNLNerdFont-SemiBold.ttf"

echo "Setup complete!"
