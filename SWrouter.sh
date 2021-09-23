#!/bin/sh

echo "start configuring SW router"

ifconfig $1 3.5.7.18 netmask 255.255.255.248
ifconfig $2 10.0.0.1 netmask 255.255.255.248


route add -net 2.4.6.8 netmask 255.255.255.248 gw 3.5.7.17
route add -net 172.16.16.0 netmask 255.255.255.248 gw 3.5.7.17

echo "END configuring SW router"

exit 
exit
