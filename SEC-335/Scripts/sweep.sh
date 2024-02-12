#!/bin/bash 

for i in {2..50}
do
	ip = "10.0.5.$i"
	
	if ping -c 1 -W 0.5 "ip" &> /dev/null; then
		echo "$ip" >> sweep.txt
	fi
done