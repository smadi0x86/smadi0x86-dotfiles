#!/bin/bash

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt-get update && sudo apt-get upgrade -y

# Install dependencies
echo "Installing core dependencies..."
sudo apt-get install -y curl wget gnupg software-properties-common ca-certificates lsb-release

# Install AWS CLI
echo "Installing AWS CLI..."
sudo apt-get install -y awscli

# Install Azure CLI
echo "Installing Azure CLI..."
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install Leapp
echo "Downloading Leapp-deb.zip, make sure to unzip and install it manually with dpkg -i..."
wget https://asset.noovolari.com/latest/Leapp-deb.zip

# Install Terraform
echo "Installing Terraform..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && sudo apt-get install -y terraform

# Install Kubernetes CLI (kubectl)
echo "Installing Kubernetes CLI..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/

# Install Helm
echo "Installing Helm..."
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Install Ansible
echo "Installing Ansible..."
sudo apt-get install -y ansible

# Install Jenkins
echo "Installing Jenkins..."
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update && sudo apt-get install -y jenkins

# Install Prometheus
echo "Installing Prometheus..."
sudo apt-get install -y prometheus

# Install Grafana
echo "Installing Grafana..."
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt-get update && sudo apt-get install -y grafana

# Install SonarQube
echo "Installing SonarQube..."
sudo apt-get install -y openjdk-11-jre
wget -qO- https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.2.46101.zip | sudo bsdtar -xvf- -C /opt
sudo ln -s /opt/sonarqube-8.9.2.46101 /opt/sonarqube
echo "SonarQube installed. Remember to configure /opt/sonarqube/conf/sonar.properties as needed."

# Install Docker
echo "Installing Docker..."
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "Docker installed successfully!"

# Install Node.js using nvm
echo "Installing Node.js using nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
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
echo "Fish shell and Oh My Fish installed"

# Disable Fish greeting
echo "Disabling Fish greeting..."
mkdir -p ~/.config/fish/functions
echo "function fish_greeting\nend" > ~/.config/fish/functions/fish_greeting.fish
echo "Fish greeting disabled"

# Set Fish as default shell
echo "Setting Fish as default shell..."
sudo chsh -s /usr/bin/fish $(whoami)
echo "Fish set as default shell"

# Install Fisher and plugins for Fish shell
echo "Installing Fisher and plugins for Fish shell..."
curl -sL https://git.io/fisher | source and fisher install jorgebucaran/fisher
fisher install edc/bass
echo "Fisher and plugins installed"

# Create and configure nvm.fish for Fish shell
echo "Creating and configuring nvm.fish..."
echo "function nvm\n    bass source ~/.nvm/nvm.sh --no-use ';' nvm \$argv\nend" | tee ~/.config/fish/functions/nvm.fish
echo "nvm.fish created and configured"

# Install Starship
echo "Installing Starship..."
curl -fsSL https://starship.rs/install.sh | sh
echo "Starship installed"

# Configure Fish to use Starship
echo "Configuring Fish with Starship..."
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
