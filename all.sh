#!/bin/sh

echo "=========== STARTED SETUP SCRIPT ==========="


if [ -f "$file" ] ; then
    rm "$file"
fi

ExperimentName="Kashchuk-IWorking"

/share/shared/Internetworking/showcabling Kashchuk-Iworking offtech > "cabling.txt"
cat cabling.txt

#NWworkstation1
NWstaion1ToNwrouter=$(head -2 cabling.txt | cut -d' ' -f2)
#NWrouter
NWrouterToNWstation1=$(head -2 cabling.txt | cut -d' ' -f9)
NWrouterToISrouter=$( (head -3 cabling.txt | tail -n -1 )| cut -d' ' -f2)
#ISrouter
ISrouterToNWrouter=$( (head -3 cabling.txt | tail -n -1 )| cut -d' ' -f9)
ISrouterToSWrouter=$( (head -4 cabling.txt | tail -n -1 )| cut -d' ' -f2)
#SWrouter
SWrouterToISrouter=$( (head -4 cabling.txt | tail -n -1 )| cut -d' ' -f9)
SWrouterToSWworkstation1=$( (head -5 cabling.txt | tail -n -1 )| cut -d' ' -f9)
#NWworkstation1
SWworkstation1ToSWrouter=$( (head -5 cabling.txt | tail -n -1 )| cut -d' ' -f2)


echo "NWrouter to NwWorkStation1: $NWrouterToNWstation1"
echo "NwWorkStation1 to NWrouter: $NWstaion1ToNwrouter"
echo "NWrouter to IS router: $NWrouterToISrouter"
echo "ISrouter to NW router: $ISrouterToNWrouter"
echo "ISrouter to SWrouter: $ISrouterToSWrouter"
echo "SWrouter to IS router: $SWrouterToISrouter"
echo "SWrouter to SWwrokstation1: $SWrouterToSWworkstation1"
echo "SWwrokstatuib1 to SWrouter: $SWworkstation1ToSWrouter"


ssh NWworkstation1.$ExperimentName.offtech "sudo sh ~/offtech/NWworkstation1.sh $NWstaion1ToNwrouter"

ssh NWrouter.$ExperimentName.offtech "sudo sh ~/offtech/NWrouter.sh $NWrouterToNWstation1 $NWrouterToISrouter"

ssh ISrouter.$ExperimentName.offtech "sudo sh ~/offtech/ISrouter.sh $ISrouterToNWrouter $ISrouterToSWrouter"

ssh SWrouter.$ExperimentName.offtech "sudo sh ~/offtech/SWrouter.sh $SWrouterToISrouter $SWrouterToSWworkstation1"

ssh SWworkstation1.$ExperimentName.offtech "sudo sh ~/offtech/SWworkstation1.sh $SWworkstation1ToSWrouter"


