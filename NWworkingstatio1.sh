#!/bin/sh

echo "configuring network station 1"

echo "Network interface of station 1 is: "
echo $1

echo "i became Super user"

ifconfig $1 172.16.16.2 netmask 255.255.255.248

echo "End configuring IP"

route add -net 2.4.6.8 netmask 255.255.255.248 gw 172.16.16.1
route add -net 3.5.7.16 netmask 255.255.255.248 gw 172.16.16.1
route add -net 10.0.0.0 netmask 255.255.255.248 gw 172.16.16.1

echo "COFNGURED ROUTES Workign station 1"

exit 
exit
