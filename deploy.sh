#!/bin/bash

#!/bin/bash

# Navigate to the app directory
cd ~/app

# Pull the latest changes from the repository
git pull origin main

# install venv
python3 -m venv venv

# Activate the Python virtual environment
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Restart the Flask service
sudo systemctl restart netflixmoviecatalog.service
