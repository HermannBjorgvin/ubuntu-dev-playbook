#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update -y

# Install software-properties-common
echo "Installing software-properties-common..."
sudo apt install -y software-properties-common

# Add Ansible PPA
echo "Adding Ansible PPA..."
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
echo "Installing Ansible..."
sudo apt install -y ansible

# Verify installation
echo "Verifying Ansible installation..."
ansible --version

echo "Ansible installation complete!"
