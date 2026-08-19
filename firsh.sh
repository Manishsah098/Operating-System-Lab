#!/bin/bash 
 
echo "ENTER THE NUMBER" 
read a 
 
max=0 
 
while [ $a -gt 0 ] 
do 
    r=$((a % 10)) 
 
    if [ $r -gt $max ] 
    then 
        max=$r 
    fi 
 
    a=$((a / 10)) 
done 
 
echo "THE LARGEST DIGIT OF THE NUMBER: $max" 