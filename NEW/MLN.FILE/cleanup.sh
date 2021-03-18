#!/bin/bash
echo -e "\n"
echo " ... STOPPING MLN ... "
sleep 3
mln stop -p project
sleep 4

echo -e "\n"
echo " ... ALL Instances Stopped ... "
sleep 3

echo -e "\n"
echo " ... REMOVING CERTIFICATES ... "
sleep 3
/opt/puppetlabs/puppet/bin/puppet cert clean vm-storage-server1
/opt/puppetlabs/puppet/bin/puppet cert clean vm-storage-server2
/opt/puppetlabs/puppet/bin/puppet cert clean vm-developer-server1
/opt/puppetlabs/puppet/bin/puppet cert clean vm-developer-server2
/opt/puppetlabs/puppet/bin/puppet cert clean vm-compiler-server1
/opt/puppetlabs/puppet/bin/puppet cert clean vm-compiler-server2
echo " "
sleep 3
echo " ... Certificates removed now! ... "
sleep 4

echo -e "\n"
echo " ... REMOVING MLN, PLEASE PRESS y then ENTER WHEN IT REQUESTS YOU! ... "
sleep 3
mln remove -p project
