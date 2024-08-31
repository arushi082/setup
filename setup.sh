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
git clone https://github.com/arushi082/ChartMetric.git

# Navigate to the cloned repository directory
cd your-repo-directory

# Provide executable access to this file
chmod +x setup.sh

# Run this file
./setup.sh

# Run the actual code
python3.11 -m src.async_main

# Create a new directory named 'data'
mkdir data

# Create a virtual environment named 'venv'
python3.11 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Upgrade pip to the latest version
pip install --upgrade pip

# Install the required packages from requirements.txt
pip install -r requirements.txt
