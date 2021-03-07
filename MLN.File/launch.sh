#!/bin/bash
echo "Building MLN"
sudo mln build -f ./project1.mln

echo "Starting MLN"
sleep 5
sudo mln start -p project1

echo "Waiting 40 seconds for intstances to deploy..."
sleep 40

sudo mln status -p project1

VAR=true

while $VAR; do
if sudo mln status -p project1 | grep -q "down"; then
    echo "One or more instances down."
    echo "Rebuilding project and instances..."
    sudo mln remove -p project1 -f
    sleep 15
    sudo mln build -f ./project1.mln -r
    sleep 10
    sudo mln start -p project1
    echo "Letting instaces start up. 40 seconds..."
    sleep 40
else
    echo "Finished"
    VAR=false
fi
done