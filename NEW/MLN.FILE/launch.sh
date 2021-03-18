#!/bin/bash
echo -e "\n"
echo " ... Building MLN now ... "
sleep 5
mln build -f ./project.mln

echo -e "\n"
echo " ... Starting MLN now ... "
sleep 2
mln start -p project

echo -e "\n"
echo " ... PLEASE WAIT FOR A FEW SEC'S FOR THE INSTANCES TO FULLY BE DEPOLOYED ... "
sleep 40
echo " ... THANKS FOR BEING PATIENT ... "
sleep 5

echo -e "\n"
echo " ... The current status of MLN ... "
sleep 5
mln status -p project

VAR=true

while $VAR; do
if mln status -p project | grep -q "down"; then
    echo " "
    echo " ... One or more instances are down ... "
    sleep 3
    echo " ... Rebuilding N Starting project and instances again ... "
    sleep 10
    echo " ... PLEASE PRESS y then ENTER, WHEN REQUESTED! ...  "
    echo " "
    mln remove -p project
    sleep 20

    echo -e "\n"
    mln build -f project.mln
    sleep 10
    echo " "
    sleep 4
    mln start -p project
    sleep 40

    echo -e "\n"
    echo " ... New status of the project ... "
    sleep 3
    mln status -p project

else
    echo -e "\n"
    echo " ... Finished ... "
    sleep 3
    echo " ... ALL instances are up & running correctly ... "
    sleep 4
    VAR=false
fi
done

echo -e "\n"
echo " ... Signing CERTIFICATES FROM THE AGENTS .. PLEASE WAIT FOR A FEW SEC'S ... "
sleep 65
echo " ... THANKS FOR BEING PATIENT ... "
sleep 15
/opt/puppetlabs/puppet/bin/puppet cert sign --all

echo -e "\n"
echo " ... Listing ALL the signed certificates ... "
sleep 4
/opt/puppetlabs/puppet/bin/puppet cert list --all

echo -e "\n"
sleep 4
echo " ... Listing all the IPs ... "
sleep 3
mln status -p project
