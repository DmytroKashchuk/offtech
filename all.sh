#!/bin/sh
NW_route2NW_work=$(head -2 NetStruct.txt | cut -d' ' -f9)

NW_work2NW_route=$(head -2 NetStruct.txt | cut -d' ' -f2)

NW_route2IS_route=$( (head -3 NetStruct.txt | tail -n -1 )| cut -d' ' -f2)

IS_route2NW_route=$( (head -3 NetStruct.txt | tail -n -1 )| cut -d' ' -f9)

IS_route2SW_route=$( (head -4 NetStruct.txt | tail -n -1 )| cut -d' ' -f9)

SW_route2IS_route=$( (head -4 NetStruct.txt | tail -n -1 )| cut -d' ' -f2)

SW_route2SW_work=$( (head -5 NetStruct.txt | tail -n -1 )| cut -d' ' -f2)

SW_work2SW_route=$( (head -5 NetStruct.txt | tail -n -1 )| cut -d' ' -f9)

echo $NW_route2NW_work

echo $NW_work2NW_route

echo $NW_route2IS_route

echo $IS_route2NW_route

echo $IS_route2SW_route

echo $SW_route2IS_route

echo $SW_route2SW_work

echo $SW_work2SW_route

ssh SWworkstation1.Kashchuk-IWorking.offtech "sudo sh ~/offtech/NWworkingstatio1.sh $NW_work2NW_route"

ssh NWrouter.Kashchuk-IWorking.offtech "sudo sh ~/offtech/NWrouter.sh $NW_route2NW_work $NW_route2IS_route"

ssh NWrouter.Kashchuk-IWorking.offtech "sudo sh ~/offtech/ISrouter.sh $IS_route2NW_route $IS_route2SW_route"

ssh NWrouter.Kashchuk-IWorking.offtech "sudo sh ~/offtech/SWrouter.sh $SW_route2IS_route $SW_route2SW_work"

ssh NWrouter.Kashchuk-IWorking.offtech "sudo sh ~/offtech/SWworkstation1.sh $SW_work2SW_route"


