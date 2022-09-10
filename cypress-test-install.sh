#!/bin/bash

#This script is to install cypress and it's dependencies
#https://docs.cypress.io/guides/getting-started/installing-cypress

Log="Cypress-Creation.log"

KuraTestRepo='kura_test_repo'

#Run as admin only check
if [ $UID != 0 ]; then
    echo "Run again with admin permissions" >> $Log
    exit 1
fi

#Update local repo database
apt-get update

#Install git if it not installed
apt-get install git -y && echo "Git is Installed" >> $Log

#Install nodejs if it not installed
DEBIAN_FRONTEND=noninteractive apt-get install nodejs -y && echo "Nodejs is Installed" >> $Log

#Install npm if it not installed
DEBIAN_FRONTEND=noninteractive apt-get install npm -y && echo "Npm is Installed" >> $Log

#Install libgtk2.0-0 if it not installed, is a dependency of Cypress
DEBIAN_FRONTEND=noninteractive apt-get install libgtk2.0-0 -y && echo "Libgtk2.0-0 is Installed" >> $Log

#Install libgtk-3-0 if it not installed, is a dependency of Cypress
DEBIAN_FRONTEND=noninteractive apt-get install libgtk-3-0 -y && echo "Libgtk-3-0 is Installed" >> $Log

#Install libgbm-dev if it not installed, is a dependency of Cypress
DEBIAN_FRONTEND=noninteractive apt-get install libgbm-dev -y && echo "Libgbm-dev is Installed" >> $Log

#Install libnotify-dev if it not installed, is a dependency of Cypress
DEBIAN_FRONTEND=noninteractive apt-get install libnotify-dev -y && echo "Libnotify-dev is Installed" >> $Log

#Install libgconf-2-4 if it not installed, is a dependency of Cypress
DEBIAN_FRONTEND=noninteractive apt-get install libgconf-2-4 -y && echo "Libgconf-2-4 is Installed" >> $Log

#Install libnss3 if it not installed, is a dependency of Cypress
DEBIAN_FRONTEND=noninteractive apt-get install libnss3 -y && echo "Libnss3 is Installed" >> $Log

#Install libxss1 if it not installed, is a dependency of Cypress
DEBIAN_FRONTEND=noninteractive apt-get install libxss1 -y && echo "Libxss1 is Installed" >> $Log

#Install libasound2 if it not installed, is a dependency of Cypress
DEBIAN_FRONTEND=noninteractive apt-get install libasound2 -y && echo "Libasound2 is Installed" >> $Log

#Install libxtst6 if it not installed, is a dependency of Cypress
DEBIAN_FRONTEND=noninteractive apt-get install libxtst6 -y && echo "Libxtst6 is Installed" >> $Log

#Install xauth if it not installed, is a dependency of Cypress
DEBIAN_FRONTEND=noninteractive apt-get install xauth -y && echo "Xauth is Installed" >> $Log

#Install xvfb if it not installed, is a dependency of Cypress
DEBIAN_FRONTEND=noninteractive apt-get install xvfb -y && echo "Xvfb is Installed" >> $Log

#Npm Install
cd $KuraTestRepo && npm install --unsafe-perm=true --allow-root && cd .. && echo "Npm Install Run" >> $Log

#Npm install cypress --save-dev
cd $KuraTestRepo && npm install cypress --unsafe-perm=true --allow-root --save-dev && cd .. && echo "Npm Install Cypress Run" >> $Log

#Successful
echo "Installation Successful" >> $Log
exit 0