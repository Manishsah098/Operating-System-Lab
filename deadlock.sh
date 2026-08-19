#!/bin/bash 
 
52 
 
echo "Enter number of processes:" 
read n 
 
echo "Enter deadlocked process numbers (if any):" 
read processes 
 
if [ -z "$processes" ] 
then 
    echo "No Deadlock Detected" 
else 
    echo "Deadlocked Processes:" 
    echo "$processes" 
fi