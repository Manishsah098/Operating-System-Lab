#!/bin/bash 
 
echo "Enter Number of Processes" 
read n 
 
for ((i=0;i<n;i++)) 
do 
    echo "Enter Burst Time for P$((i+1))" 
    read bt[$i] 
done 
 
# Sorting burst times (Ascending Order) 
for ((i=0;i<n-1;i++)) 
do 
    for ((j=i+1;j<n;j++)) 
    do 
        if [ ${bt[i]} -gt ${bt[j]} ] 
        then 
            temp=${bt[i]} 
            bt[$i]=${bt[j]} 
32 
 
            bt[$j]=$temp 
        fi 
    done 
done 
 
wt[0]=0 
 
echo 
echo -e "Process\tBT\tWT\tTAT" 
 
total_wt=0 
total_tat=0 
 
for ((i=0;i<n;i++)) 
do 
    if [ $i -ne 0 ] 
    then 
        wt[$i]=$((wt[i-1]+bt[i-1])) 
    fi 
 
    tat[$i]=$((wt[i]+bt[i])) 
 
    total_wt=$((total_wt+wt[i])) 
    total_tat=$((total_tat+tat[i])) 
 
    echo -e "P$((i+1))\t${bt[i]}\t${wt[i]}\t${tat[i]}" 
done 
 
avg_wt=$(awk "BEGIN {printf \"%.2f\", $total_wt/$n}") 
avg_tat=$(awk "BEGIN {printf \"%.2f\", $total_tat/$n}") 
 
echo 
echo "Average Waiting Time = $avg_wt" 
echo "Average Turnaround Time = $avg_tat" 