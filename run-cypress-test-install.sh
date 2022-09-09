#!/bin/bash

#This script is to run the cypress test

TestFile='./cypress/integration/test.spec.js'

Log="Cypress-Run.log"

#Run the test
cd kura_test_repo && npx cypress run --spec "$TestFile" && cd .. && echo "Ran Test" >> $Log

#successful
echo "Run successful" >> $Log
exit 0