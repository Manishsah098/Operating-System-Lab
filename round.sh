#!/bin/bash 
 
echo "Enter Number of Processes" 
read n 
 
for ((i=0;i<n;i++)) 
do 
    echo "Enter Burst Time for P$((i+1))" 
    read bt[$i] 
    rem_bt[$i]=${bt[$i]} 
done 
 
echo "Enter Time Quantum" 
read tq 
 
time=0 
 
while true 
do 
    done=1 
 
    for ((i=0;i<n;i++)) 
    do 
        if [ ${rem_bt[i]} -gt 0 ] 
        then 
            done=0 
 
            if [ ${rem_bt[i]} -gt $tq ] 
            then 
                time=$((time+tq)) 
38 
 
                rem_bt[$i]=$((rem_bt[i]-tq)) 
            else 
                time=$((time+rem_bt[i])) 
                wt[$i]=$((time-bt[i])) 
                rem_bt[$i]=0 
            fi 
        fi 
    done 
 
    [ $done -eq 1 ] && break 
done 
 
echo 
echo -e "Process\tBT\tWT\tTAT" 
 
total_wt=0 
total_tat=0 
 
for ((i=0;i<n;i++)) 
do 
    tat[$i]=$((bt[i]+wt[i])) 
 
    total_wt=$((total_wt+wt[i])) 
    total_tat=$((total_tat+tat[i])) 
 
    echo -e "P$((i+1))\t${bt[i]}\t${wt[i]}\t${tat[i]}" 
done 
 
avg_wt=$(awk "BEGIN {printf \"%.2f\", $total_wt/$n}") 
avg_tat=$(awk "BEGIN {printf \"%.2f\", $total_tat/$n}") 
 
echo 
echo "Average Waiting Time = $avg_wt" 
echo "Average Turnaround Time = $avg_tat" 