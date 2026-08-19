#!/bin/bash 
 
echo "Enter Page Size:" 
read pageSize 
 
echo "Enter Number of Pages:" 
read numPages 
 
declare -a pageTable 
 
for ((i=0;i<numPages;i++)) 
do 
    echo "Enter Frame Number for Page $i:" 
    read pageTable[$i] 
done 
 
echo "Enter Logical Address:" 
read logicalAddress 
 
pageNumber=$((logicalAddress / pageSize)) 
offset=$((logicalAddress % pageSize)) 
 
if [ $pageNumber -ge $numPages ] 
then 
    echo "Invalid Logical Address" 
    exit 
fi 
 
frameNumber=${pageTable[$pageNumber]} 
 
physicalAddress=$((frameNumber * pageSize + offset)) 
 
echo "Page Number      : $pageNumber" 
echo "Offset           : $offset" 
echo "Frame Number     : $frameNumber" 
echo "Physical Address : $physicalAddress"