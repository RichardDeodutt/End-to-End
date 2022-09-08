#!/bin/bash

#This script is to install cypress and it's dependencies

Log="/root/Creation.log"

Pathofvenv='/root/venv'

#Run as admin only check
if [ $UID != 0 ]; then
    echo "Run again with admin permissions" >> $Log
    exit 1
fi

#Update local repo database
apt-get update

#Install git if it not installed
apt-get install git -y && echo "Git is Installed" >> $Log && apt-get install default-jre -y && echo "Git is Installed" >> $Log && apt-get install nodejs -y && echo "Git is Installed" >> $Log && apt-get install maven -y && echo "Git is Installed" >> $Log && apt-get install libgtk2.0-0 -y && echo "Git is Installed" >> $Log && apt-get install libgtk-3-0 -y && echo "Git is Installed" >> $Log && apt-get install libgbm-dev -y && echo "Git is Installed" >> $Log && apt-get install libnotify-dev -y && echo "Git is Installed" >> $Log && apt-get install libgconf-2-4 -y && echo "Git is Installed" >> $Log && apt-get install libnss3 -y && echo "Git is Installed" >> $Log && apt-get install libxss1 -y && echo "Git is Installed" >> $Log && apt-get install libasound2 -y && echo "Git is Installed" >> $Log && apt-get install libxtst6 -y && echo "Git is Installed" >> $Log && apt-get install xauth -y && echo "Git is Installed" >> $Log && apt-get install xvfb -y && echo "Git is Installed" >> $Log

#successful
echo "Installation successful" >> $Log
exit 0