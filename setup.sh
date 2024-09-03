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

git clone https://github.com/sudarshan037/eventbrite_scraper.git

cd eventbrite_scraper
python3.9 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

mv ~/.wdm/drivers/chromedriver/linux64/128.0.6613.119/chromedriver-linux64/THIRD_PARTY_NOTICES.chromedriver ~/.wdm/drivers/chromedriver/linux64/128.0.6613.119/chromedriver-linux64/THIRD_PARTY_NOTICES.chromedriver.bak
cp ~/.wdm/drivers/chromedriver/linux64/128.0.6613.119/chromedriver-linux64/chromedriver ~/.wdm/drivers/chromedriver/linux64/128.0.6613.119/chromedriver-linux64/THIRD_PARTY_NOTICES.chromedriver
echo -e "\n$(date '+%T')\t Script Terminated"



if [ $? -eq 0 ]; then
    echo "Repository cloned successfully."
else
    echo "Failed to clone the repository." >&2
    exit 1
fi

echo "Setup script completed successfully."
