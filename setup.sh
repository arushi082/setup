#!/bin/bash

echo "Starting the setup script..."

# sudo add-apt-repository ppa:deadsnakes/ppa
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6A755776
echo "deb http://ppa.launchpad.net/deadsnakes/ppa/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/deadsnakes-ppa.list
apt update
apt install -y python3.9 python3.9-venv
echo -e "$(date '+%d-%m-%Y  %T')\nstarting update...\n"

apt update
apt -y upgrade
apt -y dist-upgrade
apt -y autoremove
apt -y autoclean

curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/google_linux_signing_key.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/google_linux_signing_key.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
apt-get update
apt-get install -y google-chrome-stable

mv ~/.wdm/drivers/chromedriver/linux64/128.0.6613.119/chromedriver-linux64/THIRD_PARTY_NOTICES.chromedriver ~/.wdm/drivers/chromedriver/linux64/128.0.6613.119/chromedriver-linux64/THIRD_PARTY_NOTICES.chromedriver.bak
cp ~/.wdm/drivers/chromedriver/linux64/128.0.6613.119/chromedriver-linux64/chromedriver ~/.wdm/drivers/chromedriver/linux64/128.0.6613.119/chromedriver-linux64/THIRD_PARTY_NOTICES.chromedriver
echo -e "\n$(date '+%T')\t Script Terminated"

# Cloning the private GitHub repository using PAT
echo "Cloning the private GitHub repository..."
# GITHUB_PAT="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"
REPO_URL= "https://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@github.com/sudarshan037/eventbrite_scraper.git"
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

