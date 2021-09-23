#!/bin/sh

echo "=========== Configuring NWrouter ==========="

echo "Configuring NWrouter IP"
ifconfig $1 172.16.16.1 netmask 255.255.255.248
ifconfig $2 2.4.6.10 netmask 255.255.255.248

echo "Configuring NWrouter routes"

route add -net 3.5.7.16 netmask 255.255.255.248 gw 2.4.6.9
route add -net 10.0.0.0 netmask 255.255.255.248 gw 2.4.6.9


echo "Configuring NWrouter NAT"
iptables -t nat -A POSTROUTING -o $2 -s 172.16.16.0/29 -j SNAT --to 2.4.6.10

echo "=========== END Configuring NWrouter ==========="

exit
exit
