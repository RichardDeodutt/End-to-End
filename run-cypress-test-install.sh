#!/bin/bash

#This script is to run the cypress test

TestFile='cypress/integration/test.spec'

IPandPort='127.0.0.1:5000'

Log="Cypress-Run.log"

#Replace IP and Port
cd kura_test_repo && cat "$TestFile" | sed "s/127.0.0.1:5000/$IPandPort/g" > $TestFile && cd - && echo "Replaced IP and Port" >> $Log

#Replace the Title
cd kura_test_repo && cat "$TestFile" | sed "s/URL Shortener/url shortener/g" > $TestFile && cd - && echo "Replace Title" >> $Log

#Run the test
cd kura_test_repo && npx cypress run –spec $TestFile && cd - && echo "Ran Test" >> $Log

#successful
echo "Run successful" >> $Log
exit 0