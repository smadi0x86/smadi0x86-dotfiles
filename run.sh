#!/bin/bash

# Define repository URL and clone directory
REPO_URL="https://github.com/smadi0x86/DebianSysConfig.git"
CLONE_DIR="$HOME/DebianSysConfig"

echo "Cloning the repository..."
git clone $REPO_URL $CLONE_DIR
cd $CLONE_DIR

# Ensure setup.sh is executable and run it
echo "Running setup script..."
chmod +x setup.sh
./setup.sh

# Ensure tmux.sh is executable and run it
echo "Running tmux setup script..."
chmod +x tmux.sh
./tmux.sh

# Copy configuration files
echo "Copying configuration files..."
cp -r .config/nvim ~/.config/
cp -r .config/fish ~/.config/
cp .tmux.conf ~/.tmux.conf
cp .bashrc ~/
cp .gitconfig ~/

# Apply tmux plugin setups
echo "Setting up tmux plugins..."
tmux start-server
tmux new-session -d
~/.tmux/plugins/tpm/bin/install_plugins
tmux kill-server

# Restart shell to apply changes
echo "Setup complete! Please restart your terminal for all changes to take effect."
