#!/bin/bash 
 
echo "Enter Number of Processes:" 
read n 
 
echo "Enter Safe Sequence (space separated):" 
read -a seq 
 
echo "Safe Sequence is:" 
 
for ((i=0;i<n;i++)) 
do 
    echo -n "P${seq[$i]} " 
done 
 
echo 
echo "System is in Safe State" 