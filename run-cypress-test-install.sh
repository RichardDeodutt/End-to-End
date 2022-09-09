#!/bin/bash

#This script is to run the cypress test

TestFile='kura_test_repo/cypress/integration/test.spec'

IPandPort='127.0.0.1:5000'

Log="Cypress-Run.log"

#Replace IP and Port
cat "$TestFile" | sed "s/127.0.0.1:5000/$IPandPort/g" > $TestFile && echo "Replaced IP and Port" >> $Log

#Replace the Title
cat "$TestFile" | sed "s/URL Shortener/url shortener/g" > $TestFile && echo "Replace Title" >> $Log

#Run the test
npx cypress run –spec $TestFile  && echo "Ran Test" >> $Log

#successful
echo "Run successful" >> $Log
exit 0