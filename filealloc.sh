#!/bin/bash 
 
echo "Enter Starting Block:" 
read start 
 
echo "Enter File Length:" 
read length 
 
echo "Allocated Blocks:" 
 
for ((i=0;i<length;i++)) 
do 
    echo -n "$((start+i)) " 
done 
 
echo 