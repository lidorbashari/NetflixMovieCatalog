#!/bin/bash

#!/bin/bash

# Navigate to the app directory
cd ~/app

# Pull the latest changes from the repository
git pull origin main

# install venv
if [ ! -d "venv" ]; then
python3 -m venv venv
fi

# Activate the Python virtual environment
source venv/bin/activate

# Upgrade pip to the latest version
pip install --upgrade pip

# Install dependencies
pip install -r requirements.txt

# Kill any existing instance of the app running in the background
# Adjust `app.py` if your script has a different name
pkill -f app.py || true

# Run the application in the background
nohup python app.py > app.log 2>&1 &

# Deactivate the virtual environment
deactivate

# Restart the Flask service
sudo systemctl restart netflixmoviecatalog.service
