#!/bin/bash 
 
echo "Enter Register Number:" 
read regno 
 
echo "Enter Name:" 
read name 
 
echo "$regno $name" > student.txt 
 
echo "Contents of File" 
 
cat student.txt