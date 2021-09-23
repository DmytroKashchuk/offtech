#!/bin/sh

ifconfig $1 2.4.6.9  netmask 255.255.255.248
ifconfig $2 3.5.7.17 netmask 255.255.255.248

route add -net 172.16.16.0 netmask 255.255.255.248 gw 2.4.6.10
route add -net 10.0.0.0 netmask 255.255.255.248 gw 3.5.7.18


echo "configured IS router"

exit 
exit
