#!/bin/bash

# Function to clean pacman cache
clean_pacman_cache() {
    echo "Cleaning pacman cache..."
    sudo pacman -Scc --noconfirm
}

# Function to remove unused packages
remove_unused_packages() {
    echo "Removing unused packages..."
    sudo pacman -Rns $(pacman -Qdtq) --noconfirm
}

# Function to clean the journal logs
clean_journal_logs() {
    echo "Cleaning journal logs..."
    sudo journalctl --vacuum-time=2weeks
}

# Function to clean cache from the home directory
clean_home_cache() {
    echo "Cleaning home directory cache..."
    rm -rf ~/.cache/*
}

# Function to clean orphan packages
clean_orphan_packages() {
    echo "Cleaning orphan packages..."
    sudo pacman -Rns $(pacman -Qdtq) --noconfirm
}

# Function to clean the package cache
clean_package_cache() {
    echo "Cleaning package cache..."
    sudo paccache -r
}

# Function to update the system
update_system() {
    echo "Updating the system..."
    sudo pacman -Syu --noconfirm
}

# Function to clean systemd garbage collection
clean_systemd_gc() {
    echo "Cleaning systemd garbage collection..."
    sudo systemctl daemon-reload
    sudo systemctl reset-failed
}

# Function to perform all cleaning tasks
perform_cleanup() {
    clean_pacman_cache
    remove_unused_packages
    clean_journal_logs
    clean_home_cache
    clean_orphan_packages
    clean_package_cache
    clean_systemd_gc
    update_system
}

# Execute cleanup
perform_cleanup

echo "System cleanup complete!"

