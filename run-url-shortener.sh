#!/bin/bash

#This script is to run the url-shortener flask app

Log="/root/Run.log"

Pathofvenv='/root/venv'

#Run as admin only check
if [ $UID != 0 ]; then
    echo "Run again with admin permissions" >> $Log
    exit 1
fi

#Activate the venv
source $Pathofvenv"/bin/activate" && echo "Python venv Activated" >> $Log

#Run the Flask App
cd $Pathofvenv && gunicorn --bind 0.0.0.0:80 wsgi:app && cd ..

#Deactivate the venv
deactivate && echo "Python venv Deactivated" >> $Log

#successful
echo "Run successful" >> $Log
exit 0