#!/bin/bash


echo "STOPPING MLN"
sleep 3
sudo mln stop -p project
sleep 1
echo " "
echo "Instances Stopped."
sleep 5

echo " "
echo " "
echo " "

echo "REMOVING CERTIFICATES"
sleep 3
sudo /opt/puppetlabs/puppet/bin/puppet cert clean vm-storage-server1
sudo /opt/puppetlabs/puppet/bin/puppet cert clean vm-storage-server2
sudo /opt/puppetlabs/puppet/bin/puppet cert clean vm-developer-server1
sudo /opt/puppetlabs/puppet/bin/puppet cert clean vm-developer-server2
sudo /opt/puppetlabs/puppet/bin/puppet cert clean vm-compiler-server1
sudo /opt/puppetlabs/puppet/bin/puppet cert clean vm-compiler-server2
echo " Certificates removed"
sleep 5
echo " "
echo " "
echo " "

echo "REMOVING MLN, PLEASE PRESS y WHEN IT REQUESTS YOU!"
sleep 5
sudo mln remove -p project
