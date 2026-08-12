#!/bin/bash

echo "----- First Fit Memory Allocation -----"

echo -n "Enter number of memory blocks: "
read nb

echo "Enter size of each memory block:"
for ((i=0; i<nb; i++))
do
    echo -n "Block $((i+1)): "
    read block[$i]
done

echo -n "Enter number of processes: "
read np

echo "Enter memory required for each process:"
for ((i=0; i<np; i++))
do
    echo -n "Process $((i+1)): "
    read process[$i]
done

# Allocation array
for ((i=0; i<np; i++))
do
    allocation[$i]=-1
done

# First Fit allocation
for ((i=0; i<np; i++))
do
    for ((j=0; j<nb; j++))
    do
        if [ ${block[$j]} -ge ${process[$i]} ]
        then
            allocation[$i]=$j

            # Reduce remaining memory
            block[$j]=$((block[$j] - process[$i]))

            break
        fi
    done
done

echo
echo "---------------------------------------------"
echo "Process     Required     Block     Remaining"
echo "---------------------------------------------"

for ((i=0; i<np; i++))
do
    if [ ${allocation[$i]} -ne -1 ]
    then
        b=${allocation[$i]}
        echo "P$((i+1))          ${process[$i]}          B$((b+1))        ${block[$b]}"
    else
        echo "P$((i+1))          ${process[$i]}          Not Allocated"
    fi
done

echo "---------------------------------------------"

echo
echo "Remaining Memory Blocks:"
for ((i=0; i<nb; i++))
do
    echo "Block $((i+1)) : ${block[$i]}"
done