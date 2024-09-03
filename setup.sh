#!/bin/bash

# Install Python 3.11
#!/bin/bash

echo "Starting the setup script..."

# Installing Python 3.11
echo "Installing Python 3.11..."
sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update -y
sudo apt-get install -y python3.11 python3.11-venv python3.11-dev

# Check Python version
if python3.11 --version; then
    echo "Python 3.11 installation successful."
else
    echo "Python 3.11 installation failed." >&2
    exit 1
fi

# Cloning the private GitHub repository using PAT
echo "Cloning the private GitHub repository..."
GITHUB_PAT="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"
REPO_URL="https://${GITHUB_PAT}@github.com/arushi082/ChartMetric.git"
git clone $REPO_URL

if [ $? -eq 0 ]; then
    echo "Repository cloned successfully."
else
    echo "Failed to clone the repository." >&2
    exit 1
fi

echo "Setup script completed successfully."

# # Navigate to the cloned repository directory
# cd ChartMetric

# # Provide executable access to this file
# chmod +x setup.sh

# # Run this file
# ./setup.sh

# # Run the actual code
# # python3.11 -m src.async_main

# # # Create a new directory named 'data'
# # mkdir data

# # # Create a virtual environment named 'venv'
# # python3.11 -m venv venv

# # # Activate the virtual environment
# # source venv/bin/activate

# # # Upgrade pip to the latest version
# # pip install --upgrade pip

# # # Install the required packages from requirements.txt
# # pip install -r requirements.txt

