#!/bin/bash

#This script is to install cypress and it's dependencies

Log="Cypress Creation.log"

Pathofvenv='/root/venv'

#Run as admin only check
if [ $UID != 0 ]; then
    echo "Run again with admin permissions" >> $Log
    exit 1
fi

#Update local repo database
apt-get update

#Install git if it not installed
apt-get install git -y && echo "Git is Installed" >> $Log && apt-get install default-jre -y && echo "Default-jre is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install nodejs -y && echo "Nodejs is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install npm -y && echo "Npm is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install maven -y && echo "Maven is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install libgtk2.0-0 -y && echo "Libgtk2.0-0 is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install libgtk-3-0 -y && echo "Libgtk-3-0 is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install libgbm-dev -y && echo "Libgbm-dev is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install libnotify-dev -y && echo "Libnotify-dev is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install libgconf-2-4 -y && echo "Libgconf-2-4 is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install libnss3 -y && echo "Libnss3 is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install libxss1 -y && echo "Libxss1 is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install libasound2 -y && echo "Libasound2 is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install libxtst6 -y && echo "Libxtst6 is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install xauth -y && echo "Xauth is Installed" >> $Log && DEBIAN_FRONTEND=noninteractive apt-get install xvfb -y && echo "Xvfb is Installed" >> $Log

#successful
echo "Installation successful" >> $Log
exit 0