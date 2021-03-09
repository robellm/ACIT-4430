#!/bin/bash
echo " "
echo "Building MLN now ..."
sleep 3
mln build -f ./project.mln
echo " "

echo " "
echo "Starting MLN now ... "
sleep 2
mln start -p project
echo " "
echo " PLEASE WAIT A FEW SEC'S FOR THE INSTANCES TO FULLY BE DEPOLOYED ... "
sleep 40
echo " THANKS FOR BEING PATIENT"
sleep 5
echo " "

echo " "
echo "The current status of MLN ... "
echo " "
sleep 2
mln status -p project

VAR=true

while $VAR; do
if mln status -p project | grep -q "down"; then
    echo " "
    echo "One or more instances are down ... "
    echo "Rebuilding project and instances again..."
    echo " "

    sleep 10
    echo "PLEASE PRESS y then ENTER, WHEN REQUESTED!"
    mln remove -p project
    sleep 20
    echo " "

    mln build -f project.mln
    sleep 10
    echo "PLEASE BE PATIENT"
    echo "PLEASE PRESS y then ENTER, WHEN REQUESTED!"
    sleep 3
    mln start -p project
    echo " "
    sleep 40

    echo " "
    echo "New status of the project"
    echo " "
    mln status -p project
else
    echo " "
    echo "Finished"
    echo "ALL instances are up & running correctly"
    VAR=false
fi
done

echo " "
echo "Signing CERTIFICATES FROM THE AGENTS.. PLEASE WAIT A FEW SEC'S"
echo " "
sleep 20
/opt/puppetlabs/puppet/bin/puppet cert sign --all
echo " "
echo " "
sleep 5
echo "Listing ALL the signed certificates"
echo " "
sleep 2
/opt/puppetlabs/puppet/bin/puppet cert list --all
echo " "
sleep 3
echo " "
echo " Listing all the IPs "
sleep 1
mln status -p project
