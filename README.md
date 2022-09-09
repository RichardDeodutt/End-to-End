# End-to-End
End to End Testing

## Instructions For Setting up the Url Shortener

Copy the contents of the `url-shortener-deployment.sh` script and paste to the **'User data'** field in EC2 instance creation page where you can load your script to be run at boot. The scripts should take care of everything else. 

When the EC2 is up and running you can check if the url shortener is up by going to the **http URL** of your **public EC2 IP**. **Make sure it's the http page and not the https page as your browser might automatically use the https protocol. The port used is 80 which is the default port for http so it does not need to be specified.** 

Example of how a URL should look below (Not a real URL): 

`http://34.77.169.130/`

## Instructions For Setting up the Cypress Test

Git clone **this repository onto the machine where you will be running Cypress** to test the url shortener. 

Example below using https or ssh: 

`git clone https://github.com/RichardDeodutt/End-to-End.git`

`git clone git@github.com:RichardDeodutt/End-to-End.git`

Then run the `cypress-test-install.sh` script to install Cypress and all it's dependencies. 

After that edit the file `kura_test_repo/cypress/integration/test.spec.js` to the requirments for testing. 

When all that is done run the `run-cypress-test-install.sh` script to run the Cypress test and get the test results. 

## Files

`url-shortener-deployment.sh` is the file that contains the deplyoment script to be run on ec2 creation. 

`install-url-shortener.sh` is the file to install everything required. 

`run-url-shortener.sh` is the script to run the flask app. 

`url-shortener.service` is the systemd servive to run the script 'run-url-shortener.sh' on boot. 

`cypress-test-install.sh` is the script to install cypress and all it's dependencies for the testing. 

`run-cypress-test-install.sh` is the script to run the cypress test after everything is prepared. 