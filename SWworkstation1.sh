#!/bin/sh

echo "=========== Configuring SWworkstation1 ==========="

echo "Configuring SWworkstation1 IP"
ifconfig $1 10.0.0.2 netmask 255.255.255.248

echo "Configuring SWworkstation1 routes"
route add -net 3.5.7.16 netmask 255.255.255.248 gw 10.0.0.1
route add -net 2.4.6.8 netmask 255.255.255.248 gw 10.0.0.1
route add -net 172.16.16.0 netmask 255.255.255.248 gw 10.0.0.1


echo "=========== END Configuring SWworkstation1 ==========="

echo "CONFIGURED THE LAST HOST"

exit
exit
