# End-to-End
End to End Test

## Instructions For Setting up the Url Shortener

Copy the contents of `url-shortener-deployment.sh` and paste to the 'User data' field in ec2 creation where you can load your script to be run at boot. The scripts should take care of everything else. 

When the ec2 is up you can check if the url shortener is up by going to the http url of your ec2 ip. Make sure it's the http page and not the https page as your browser might automatically use the https protocol. The port is 80 which is http so it does not need to be specified. 

## Instructions For Setting up the Cypress Test

Git clone this repo onto the machine where you will be running Cypress to be testing. 

Then run `cypress-test-install.sh` to install Cypress and all it's dependencies. 

After that edit the file `/kura_test_repo/cypress/integration/test.spec.js` to the requirments. 

When all that is done run `run-cypress-test-install.sh` to run the test and get the report

## Files

`url-shortener-deployment.sh` is the file that contains the deplyoment script to be run on ec2 creation

`install-url-shortener.sh` is the file to install everything required

`run-url-shortener.sh` is the script to run the flask app

`url-shortener.service` is the systemd servive to run the script 'run-url-shortener.sh' on boot