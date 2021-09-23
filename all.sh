#!/bin/sh

echo "STARTED SETUP SCRIPT"

file="NetStruct.txt"

if [ -f "$file" ] ; then
    rm "$file"
fi

/share/shared/Internetworking/showcabling Kashchuk-Iworking offtech > "NetStruct.txt"

cat NetStruct.txt

NW_route2NW_work=$(head -2 NetStruct.txt | cut -d' ' -f9)

NW_work2NW_route=$(head -2 NetStruct.txt | cut -d' ' -f2)

NW_route2IS_route=$( (head -3 NetStruct.txt | tail -n -1 )| cut -d' ' -f2)

IS_route2NW_route=$( (head -3 NetStruct.txt | tail -n -1 )| cut -d' ' -f9)

IS_route2SW_route=$( (head -4 NetStruct.txt | tail -n -1 )| cut -d' ' -f9)

SW_route2IS_route=$( (head -4 NetStruct.txt | tail -n -1 )| cut -d' ' -f2)

SW_route2SW_work=$( (head -5 NetStruct.txt | tail -n -1 )| cut -d' ' -f2)

SW_work2SW_route=$( (head -5 NetStruct.txt | tail -n -1 )| cut -d' ' -f9)

echo "Interface of NWrouter to NwWorkStation1:  $NW_route2NW_work"

echo "Interface of NwWorkStation1 to NWrouter: $NW_work2NW_route"

echo "Interface NWrouter to IS router: $NW_route2IS_route"

echo "ISrouter to NW router: $IS_route2NW_route"

echo "ISrouter to SWrouter: $IS_route2SW_route"

echo "SWrouter to IS router: $SW_route2IS_route"

echo "SWrouter to SWwrokstation1: $SW_route2SW_work"

echo "SWwrokstatuib1 to SWrouter: $SW_work2SW_route"

ssh NWworkstation1.Kashchuk-IWorking.offtech "sudo sh ~/offtech/NWworkingstatio1.sh $NW_work2NW_route"

ssh NWrouter.Kashchuk-IWorking.offtech "sudo sh ~/offtech/NWrouter.sh $NW_route2NW_work $NW_route2IS_route"

ssh ISrouter.Kashchuk-IWorking.offtech "sudo sh ~/offtech/ISrouter.sh $IS_route2NW_route $IS_route2SW_route"

ssh SWrouter.Kashchuk-IWorking.offtech "sudo sh ~/offtech/SWrouter.sh $SW_route2IS_route $SW_route2SW_work"

ssh SWworkstation1.Kashchuk-IWorking.offtech "sudo sh ~/offtech/SWworkstation1.sh $SW_work2SW_route"


