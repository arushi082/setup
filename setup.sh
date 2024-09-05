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

sudo rm -f /etc/apt/trusted.gpg.d/google_linux_signing_key.gpg
curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/google_linux_signing_key.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/google_linux_signing_key.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
apt-get update
apt-get install -y google-chrome-stable

git clone https://github.com/sudarshan037/eventbrite_scraper.git

cd eventbrite_scraper
git checkout develop_v4
python3.9 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

mv /home/adminuser/.wdm/drivers/chromedriver/linux64/128.0.6613.119/chromedriver-linux64/THIRD_PARTY_NOTICES.chromedriver /home/adminuser/.wdm/drivers/chromedriver/linux64/128.0.6613.119/chromedriver-linux64/THIRD_PARTY_NOTICES.chromedriver.bak
cp /home/adminuser/.wdm/drivers/chromedriver/linux64/128.0.6613.119/chromedriver-linux64/chromedriver /home/adminuser/.wdm/drivers/chromedriver/linux64/128.0.6613.119/chromedriver-linux64/THIRD_PARTY_NOTICES.chromedriver
echo -e "\n$(date '+%T')\t Script Terminated"



if [ $? -eq 0 ]; then
    echo "Repository cloned successfully."
else
    echo "Failed to clone the repository." >&2
    exit 1
fi

# tmux new-session -d -s my_scraper_session "scrapy crawl events"

scrapy crawl events

# Check if the tmux session started successfully
if [ $? -eq 0 ]; then
    echo "Scrapy crawler started in tmux session 'my_scraper_session'."
else
    echo "Failed to start the Scrapy crawler in tmux." >&2
    exit 1
fi

echo -e "\n$(date '+%T')\t Script Terminated"
echo "Setup script completed successfully."
echo "Setup script completed successfully."
