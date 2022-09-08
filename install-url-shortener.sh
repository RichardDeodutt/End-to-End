#!/bin/bash

#This script is to install the url-shortener flask app and it's dependencies and start the service

Log="/root/Creation.log"

Pathofvenv='/root/venv'

#Run as admin only check
if [ $UID != 0 ]; then
    echo "Run again with admin permissions" >> Log
    exit 1
fi

#Update local repo database
apt-get update

#Install pip then venv then git if it not installed
apt-get install python3-pip -y && echo "Python pip is Installed" >> Log && apt-get install python3.10-venv -y && echo "Python venv is Installed" >> Log && apt-get install git -y && echo "Git is Installed" >> Log

#Install pip venv enviormentent
python3 -m venv $Pathofvenv && echo "Python venv Directory is Installed" >> Log

#Activate the venv
source $Pathofvenv"/bin/activate" && echo "Python venv Activated" >> Log

#Install Flask
pip install flask && echo "Flask is Installed" >> Log

#Install Gunicorn
pip install gunicorn && echo "Gunicorn is Installed" >> Log

#Deactivate the venv
deactivate && echo "Python venv Deactivated" >> Log

#Copy the run script to bin
cp run-url-shortener.sh /bin/run-url-shortener.sh && echo "Script 'run-url-shortener.sh' Installed" >> Log

#Chmod the script to Executable
chmod +x /bin/run-url-shortener.sh && echo "Script 'run-url-shortener.sh' Executable" >> Log

#Copy the systemd service to the rest of the services
cp url-shortener.service /etc/systemd/system/url-shortener.service && echo "Service 'url-shortener.service' Installed" >> Log

#Enable the service
systemctl enable url-shortener && echo "Service 'url-shortener.service' Enabled" >> Log

#Start the service
systemctl start url-shortener && echo "Service 'url-shortener.service' Started" >> Log

#successful
echo "Installation successful" >> Log
exit 0