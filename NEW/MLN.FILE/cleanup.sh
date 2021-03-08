#!/bin/bash
echo " "
echo "STOPPING MLN"
echo " "
sleep 2
mln stop -p project
sleep 1

echo " "

echo "ALL Instances Stopped."
sleep 2

echo " "

echo "REMOVING CERTIFICATES"
sleep 2
/opt/puppetlabs/puppet/bin/puppet cert clean vm-storage-server1
/opt/puppetlabs/puppet/bin/puppet cert clean vm-storage-server2
/opt/puppetlabs/puppet/bin/puppet cert clean vm-developer-server1
/opt/puppetlabs/puppet/bin/puppet cert clean vm-developer-server2
/opt/puppetlabs/puppet/bin/puppet cert clean vm-compiler-server1
/opt/puppetlabs/puppet/bin/puppet cert clean vm-compiler-server2
echo " "
echo "Certificates removed now!"
sleep 2

echo " "

echo "REMOVING MLN, PLEASE PRESS y then ENTER WHEN IT REQUESTS YOU!"
echo " "
sleep 2
mln remove -p project
