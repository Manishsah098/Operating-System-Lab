#!/bin/bash 
 
echo "ENTER THE STRING TO CHECK PALINDROME" 
read str 
 
len=$(echo -n "$str" | wc -c) 
 
i=1 
j=$((len / 2)) 
 
while [ $i -le $j ] 
do 
    k=$(echo "$str" | cut -c $i) 
    l=$(echo "$str" | cut -c $len) 
 
    if [ "$k" != "$l" ] 
    then 
        echo "$str is not a palindrome" 
        exit 
    fi 
 
    i=$((i + 1)) 
    len=$((len - 1)) 
done 
 
echo "$str is a palindrome" 