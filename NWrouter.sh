#!/bin/sh

ifconfig $1 172.16.16.1 netmask 255.255.255.248
ifconfig $2 2.4.6.10 netmask 255.255.255.248


route add -net 3.5.7.16 netmask 255.255.255.248 gw 2.4.6.9
route add -net 10.0.0.0 netmask 255.255.255.248 gw 2.4.6.9


echo "configured NWrouter routes"

exit
exit
