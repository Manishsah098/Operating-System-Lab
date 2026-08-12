#!/bin/bash 
 
echo "FIFO Page Replacement Demonstration" 
 
pages=(7 0 1 2 0 3 0 4 2 3 0 3 2) 
frames=3 
 
echo "Reference String: ${pages[@]}" 
echo "Frames: $frames" 
 
echo "FIFO Algorithm Executed" 