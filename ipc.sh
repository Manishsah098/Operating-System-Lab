#!/bin/bash 
 
( 
echo "Message from Child Process" 
) | while read msg 
do 
    echo "Parent Received: $msg" 
done