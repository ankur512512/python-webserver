#!/bin/sh

echo -e "\n\nInstalling and Running the web server\n\n"
python3 server.py &

sleep 5

echo -e "\n\nNow executing test cases...\n\n"
python3 test.py && sh