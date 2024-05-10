#!/bin/bash

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt-get update && sudo apt-get upgrade -y

# Install common dependencies
echo "Installing common dependencies..."
sudo apt-get install -y curl wget gnupg software-properties-common apt-transport-https ca-certificates

# Install AWS CLI
echo "Installing AWS CLI..."
sudo apt-get install awscli -y

# Install Azure CLI
echo "Installing Azure CLI..."
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install Terraform
echo "Installing Terraform..."
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
sudo apt-get install ansible -y

# Install Jenkins
echo "Installing Jenkins..."
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update && sudo apt-get install jenkins -y

# Install Prometheus
echo "Installing Prometheus..."
sudo apt-get install prometheus -y

# Install Grafana
echo "Installing Grafana..."
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt-get update && sudo apt-get install grafana -y

# Install Docker
echo "Installing Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Install tmux
echo "Installing tmux..."
sudo apt install tmux -y
cp ~/smadi0x86-setup/.tmux.conf ~/.tmux.conf
cp -r ~/smadi0x86-setup/.tmux/plugins ~/.tmux/

# Install Fish shell
echo "Installing Fish shell..."
sudo apt install fish -y
curl -L https://get.oh-my.fish | fish
fish -c "omf install bobthefish"

# Set Fish as default shell
echo "Setting Fish as default shell..."
chsh -s /usr/bin/fish

# Install Neovim
echo "Installing Neovim..."
sudo snap install nvim --classic

# Install Python and pip for Neovim plugins
echo "Installing Python and pip..."
sudo apt install python3 python3-pip -y
pip3 install neovim

# Copy Neovim configuration
mkdir -p ~/.config/nvim
cp ~/smadi0x86-setup/init.vim ~/.config/nvim/

# Install Node.js for Neovim plugins
echo "Installing Node.js..."
curl -sL install-node.now.sh/lts | bash

# Install and configure tmux
echo "Configuring tmux..."
cp ~/smadi0x86-setup/.tmux.conf ~/

# Copy Neovim and tmux configuration files from a predefined directory
echo "Copying Neovim and tmux configuration files..."
cp ~/smadi0x86-setup/init.vim ~/.config/nvim/
cp ~/smadi0x86-setup/.tmux.conf ~/.tmux.conf

# Configure tmux
echo "Configuring tmux..."
sudo apt install -y tmux
cp ~/smadi0x86-setup/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux start-server
tmux new-session -d
~/.tmux/plugins/tpm/bin/install_plugins
tmux kill-server

# Install Fish shell
echo "Installing Fish shell..."
sudo apt install -y fish
curl -L https://get.oh-my.fish | fish

# Make Fish the default shell
echo "Making Fish the default shell..."
chsh -s /usr/bin/fish

# Install Fisher and plugins for Fish
echo "Installing Fisher and plugins for Fish..."
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
fish -c "fisher install edc/bass"

# Configure Fish shell to disable the greeting
echo "Configuring Fish shell..."
echo "set fish_greeting" | sudo tee -a ~/.config/fish/config.fish

# Set up NVM with Fish
echo "Setting up NVM with Fish..."
mkdir -p ~/.config/fish/functions
echo "function nvm" > ~/.config/fish/functions/nvm.fish
echo "  bass source ~/.nvm/nvm.sh --no-use ';' nvm \$argv" >> ~/.config/fish/functions/nvm.fish
echo "end" >> ~/.config/fish/functions/nvm.fish

# Install Starship prompt
echo "Installing Starship prompt..."
curl -fsSL https://starship.rs/install.sh | sh
echo 'eval "$(starship init fish)"' | sudo tee -a ~/.config/fish/config.fish

# Install Neovim
echo "Installing Neovim..."
sudo snap install nvim --classic

# Set up Neovim with initial plugins and configuration
echo "Setting up Neovim..."
mkdir -p ~/.config/nvim
cp ~/smadi0x86-setup/init.vim ~/.config/nvim/

# Install vim-plug for Neovim
echo "Installing vim-plug for Neovim..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install plugins via vim-plug
nvim --headless +PlugInstall +qall

# Finalize
echo "Setup complete! Please restart your terminal or log out and log back in for all changes to take effect, especially for the default shell change."
