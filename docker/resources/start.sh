#!/bin/sh

echo -e "Installing and Running the web server\n\n"
python3 server.py &

echo -e "Sleeping for 5 seconds for web server to be up...\n\n"
sleep 5

echo -e "Now executing test cases...\n\n"
python3 test.py