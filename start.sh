#!/bin/bash

echo "Starting the scraper script..."

cd ~/eventbrite_scraper
git checkout develop_v4
source venv/bin/activate
scrapy crawl events

echo "Startup script completed successfully."
