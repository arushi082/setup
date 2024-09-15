#!/bin/bash

# # # works on the newly created VM to install whatever tools are required for ScalingScraper
# # # wget --header="Authorization: token YOUR_PERSONAL_ACCESS_TOKEN" -O ~/setup.sh https://raw.githubusercontent.com/arushi082/ScalingScraper/main/setup.sh
# # # sudo bash setup.sh

echo "Starting the setup script..."

# Pulling public keys from github for passwordless sign-in
ssh-import-id-gh arushi082
ssh-import-id-gh sudarshan037

# sudo add-apt-repository ppa:deadsnakes/ppa
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6A755776
echo "deb http://ppa.launchpad.net/deadsnakes/ppa/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/deadsnakes-ppa.list
apt update
apt install -y python3.9 python3.9-venv
echo -e "$(date '+%d-%m-%Y  %T')\nstarting update...\n"

apt update
# apt -y upgrade
# apt -y dist-upgrade
# apt -y autoremove
# apt -y autoclean

sudo rm -f /etc/apt/trusted.gpg.d/google_linux_signing_key.gpg
curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/google_linux_signing_key.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/google_linux_signing_key.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
apt-get update
apt-get install -y google-chrome-stable

echo -e "\n$(date '+%T')\t Script Terminated"
echo "Setup script completed successfully."
