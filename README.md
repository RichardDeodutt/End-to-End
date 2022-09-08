# End-to-End
End to End Test

##Instructions

Copy the contents of `url-shortener-deployment.sh` and paste to the 'User data' field in ec2 creation where you can load your script to be run at boot. The scripts should take care of everything else. 

##Files

`url-shortener-deployment.sh` is the file that contains the deplyoment script to be run on ec2 creation

`install-url-shortener.sh` is the file to install everything required

`run-url-shortener.sh` is the script to run the flask app

`url-shortener.service` is the systemd servive to run the script 'run-url-shortener.sh' on boot