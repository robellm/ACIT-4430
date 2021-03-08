#!/bin/bash
echo " "
echo "Building MLN now ... "
echo " "
sleep 2
mln build -f project.mln
echo " "
echo " "

echo "Starting MLN now ... "
echo " "
sleep 2
mln start -p project
echo " "
echo " "

echo "The current status of MLN ... "
echo " "
sleep 2
mln status -p project

VAR=true

while $VAR; do
if sudo mln status -p project | grep -q "down"; then
    echo " "
    echo " "
    echo "One or more instances are down .. "
    echo "Restarting the project & instances..."
    echo "Making sure all instances are up & running correctly.."
    echo "PLEASE TYPE y then ENTER WHEN IT REQUESTS YOU!"
    sleep 1
    mln start -p project
    sleep 1
else
    echo " "
    echo "Finished"
    VAR=false
fi
done

echo " "
echo " "

echo "Signing CERTIFICATES FROM THE AGENTS"
echo " "
sleep 2
/opt/puppetlabs/puppet/bin/puppet cert sign --all
echo " "
echo " "
sleep 2
echo "Listing ALL the signed certificates"
echo " "
sleep 2
/opt/puppetlabs/puppet/bin/puppet cert list --all
echo " "
