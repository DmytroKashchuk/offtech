#!/bin/sh

sudo su -
ifconfig $1 172.16.16.2 netmask 255.255.255.248

exit
exit