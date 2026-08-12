#!/bin/bash 
 
LOCKFILE="/tmp/mylock" 
 
while [ -f "$LOCKFILE" ] 
do 
    sleep 1 
done 
 
touch "$LOCKFILE" 
 
echo "Entering Critical Section" 
sleep 5 
echo "Leaving Critical Section" 
 
rm -f "$LOCKFILE" 