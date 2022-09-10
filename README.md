# End-to-End

The Objective was to demonstrate my ability to do end to end testing on an application in this case the **URL Shortener Flask App**. 
I took it a step further and tried to automate as much as I could with what I knew at the time. 

## Missions/Tasks

- ### Task 1: 
    - Create or use an existing Ubuntu EC2 to run the Flask App URL Shortener

- ### Task 2: 
    - On another machine preferably and with good specifications install the following packages or make sure it's installed: 
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
    - In the kura_test_repo run the following command to do the test: 
        `npx cypress run --spec "./cypress/integration/test.spec.js"` 

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

`sudo ./cypress-test-install.sh`

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

## Task Questions

- #### Did the test work? If not then why?
    - The **test failed** because the website title is **"URL Shortener"** and it only passes if it's **"url shortener"** according to the testfile [kura_test_repo/cypress/integration/test.spec.js](https://github.com/RichardDeodutt/End-to-End/blob/main/kura_test_repo/cypress/integration/test.spec.js) after our last edit to the that file. 

- #### Are there files of the test saved somewhere?
    - Yes, there is a screenshot stored in the `./cypress/screenshots/test.spec.js/` folder and a video stored in the `./cypress/videos/` folder for the failed run. When it ran successfully there was only a video in the `./cypress/videos/` folder. 

- #### How did you correct the test?
    - This the can be corrected by changing `.should("equal", "url shortener")` to `.should("equal", "URL Shortener")` like it was previously in the test file [kura_test_repo/cypress/integration/test.spec.js](https://github.com/RichardDeodutt/End-to-End/blob/main/kura_test_repo/cypress/integration/test.spec.js) which will match the actual title of the website. 

## Issues

Mac users with an **arm64 architecture on Linux can't use the `8.7.0` version of cypress** that is in the [package.json](https://github.com/RichardDeodutt/End-to-End/blob/main/kura_test_repo/package.json). 

This is the link to the [Git Issue](https://github.com/cypress-io/cypress/issues/4478)

To fix this issue you need to change the cypress version in [package.json](https://github.com/RichardDeodutt/End-to-End/blob/main/kura_test_repo/package.json) from `"cypress": "^8.7.0"` to `"cypress": "^10.2.0"`.

Then in the kura_test_repo delete the `nodes_modules` folder to be able to rebuild the app. 

Example below: 

- `sudo rm -r nodes_modules`

When that is done in the same directory run the commands below to rebuild it: 

- `npm install` 
- `npm install cypress --save-dev` 

After that you need to migrate the files to the updated version by running the `npx cypress open` command in the kura_test_repo and following the migration tool gui to update the files to the latest standards. 

Example below: 

- `npx cypress open`

Once done the migration is completed then everything is done and the cypress test can be run in the kura_test_repo but the test file is renamed to **test.cy.js**

Example below: 

- `npx cypress run --spec "./cypress/integration/test.cy.js"`