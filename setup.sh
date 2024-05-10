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
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ~/smadi0x86-setup/.tmux.conf ~/.tmux.conf
cp -r ~/smadi0x86-setup/.tmux/plugins ~/.tmux/
tmux start-server
tmux new-session -d
~/.tmux/plugins/tpm/bin/install_plugins
tmux kill-server

# Install Fish shell
echo "Installing Fish shell..."
sudo apt install fish -y
curl -L https://get.oh-my.fish | fish
fish -c "omf install bobthefish"
chsh -s /usr/bin/fish

# Install Fisher and plugins for Fish
echo "Installing Fisher and plugins for Fish..."
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
fish -c "fisher install edc/bass"
echo "set fish_greeting" | sudo tee -a ~/.config/fish/config.fish

# Install Starship prompt
echo "Installing Starship prompt..."
curl -fsSL https://starship.rs/install.sh | sh
echo 'eval "$(starship init fish)"' | sudo tee -a ~/.config/fish/config.fish

# Install Neovim
echo "Installing Neovim..."
sudo snap install nvim --classic

# Prepare Neovim environment
echo "Setting up Neovim environment..."
mkdir -p ~/.config/nvim
cp ~/smadi0x86-setup/init.vim ~/.config/nvim/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/packer/start/lazy.nvim \
       --create-dirs https://github.com/folke/lazy.nvim'

# Install Python and pip for Neovim plugins
echo "Installing Python and pip..."
sudo apt install python3 python3-pip -y
pip3 install neovim

# Install Node.js for Neovim plugins
echo "Installing Node.js..."
curl -sL install-node.now.sh/lts | bash

# Install and configure Neovim plugins
echo "Configuring Neovim plugins..."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'LazySetup' -c 'MasonInstallAll' -c 'qa'

echo "Setup complete! Please restart your terminal or log out and log back in for all changes to take effect, especially for the default shell change."
