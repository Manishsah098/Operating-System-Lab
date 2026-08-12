#!/bin/bash 
 
task1() 
{ 
    for i in 1 2 3 4 5 
    do 
        echo "Thread 1 : $i" 
        sleep 1 
    done 
} 
 
task2() 
{ 
    for i in 1 2 3 4 5 
    do 
        echo "Thread 2 : $i" 
55 
 
        sleep 1 
    done 
} 
 
task1 & 
task2 & 
wait 
echo "All Threads Completed" 