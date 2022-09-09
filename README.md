# End-to-End

The Objective was to demonstrate my ability to do end to end testing on an application in this case the **URL Shortener Flask App**. 
I took it a step further and tried to automate as much as I could with what I knew at the time. 

## Missions/Tasks

- ### Task 1: 
    - Create or use an existing Ubuntu EC2 to run the Flask App URL Shortener

- ### Task 2: 
    - One another machine preferably and with good specifications install the following packages or make sure it's installed: 
        - git
        - nodejs
        - npm
        - libgtk2.0-0
        - libgtk-3-0
        - libgbm-dev
        - libnotify-dev
        - libgconf-2-4
        - libnss3
        - libxss1
        - libasound2
        - libxtst6
        - xauth
        - xvfb

- ### Task 3: 
    - In the kura_test_repo run the following commands: 
        - `npm install` 
        - `npm install cypress --save-dev` 
    - In the 'kura_test_repo/cypress/integration/test.spec.js' file do the following changes: 
        - In `cy.visit` change the IP and or Port to your public EC2 IP and or Port. 
        - In `.should("equal", "URL Shortener")` Change "URL Shortener" to "url shortener". 

- ### Task 4: 
    - Run the following command to do the test: 
        `npx cypress run –-spec "./cypress/integration/test.spec.js"` 

## Instructions For Setting up the Url Shortener

Copy the contents of the [url-shortener-deployment.sh](https://github.com/RichardDeodutt/End-to-End/blob/main/url-shortener-deployment.sh) script and paste to the **'User data'** field in EC2 instance creation page where you can load your script to be run at boot. The scripts should take care of everything else. 

When the EC2 is up and running you can check if the URL Shortener is up by going to the **http URL** of your **public EC2 IP**. **Make sure it's the http page and not the https page as your browser might automatically use the https protocol. The port used is 80 which is the default port for http so it does not need to be specified.** 

Example of how a URL should look like below (Not a working URL): 

`http://34.77.169.130/`

## Instructions For Setting up the Cypress Test

Git clone **this repository onto the machine where you will be running Cypress** to test the URL Shortener. 

Example below using https or ssh: 

`git clone https://github.com/RichardDeodutt/End-to-End.git`

`git clone git@github.com:RichardDeodutt/End-to-End.git`

When it is cloned then change into the repository directory.

Example below: 

`cd End-to-End`

Then run the [cypress-test-install.sh](https://github.com/RichardDeodutt/End-to-End/blob/main/run-cypress-test-install.sh) script to install Cypress and all it's dependencies. 

Example below:

`./cypress-test-install.sh`

After that edit the file [kura_test_repo/cypress/integration/test.spec.js](https://github.com/RichardDeodutt/End-to-End/blob/main/kura_test_repo/cypress/integration/test.spec.js) to the requirments for testing on your testing machine. 

Example below using nano:

`nano kura_test_repo/cypress/integration/test.spec.js`

When all that is done run the [run-cypress-test-install.sh](https://github.com/RichardDeodutt/End-to-End/blob/main/run-cypress-test-install.sh) script to run the Cypress test and get the test results. 

Example below:

`./run-cypress-test-install.sh`

## Files

[url-shortener-deployment.sh](https://github.com/RichardDeodutt/End-to-End/blob/main/url-shortener-deployment.sh) is the file that contains the deplyoment script to be run on ec2 creation. 

[install-url-shortener.sh](https://github.com/RichardDeodutt/End-to-End/blob/main/install-url-shortener.sh) is the file to install everything required. 

[run-url-shortener.sh](https://github.com/RichardDeodutt/End-to-End/blob/main/run-url-shortener.sh) is the script to run the flask app. 

[url-shortener.service](https://github.com/RichardDeodutt/End-to-End/blob/main/url-shortener.service) is the systemd servive to run the script [run-url-shortener.sh](https://github.com/RichardDeodutt/End-to-End/blob/main/run-url-shortener.sh) on boot. 

[cypress-test-install.sh](https://github.com/RichardDeodutt/End-to-End/blob/main/cypress-test-install.sh) is the script to install cypress and all it's dependencies for the testing. 

[run-cypress-test-install.sh](https://github.com/RichardDeodutt/End-to-End/blob/main/run-cypress-test-install.sh) is the script to run the cypress test after everything is prepared. 