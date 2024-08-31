#!/bin/bash

# Install Python 3.11
echo "Installing Python 3.11..."
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install -y python3.11 python3.11-venv python3.11-dev

# Check Python version
python3.11 --version

# Clone the GitHub repository
echo "Cloning the GitHub repository..."
