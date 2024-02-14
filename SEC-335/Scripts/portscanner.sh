#!/bin/bash

# Get host/port files
hostfile="hosts.txt"
portfile="tcpports.txt"

if [ $2 -eq 0 ]; then
	read -p "Enter path to portfile: " $portfile
	
	if [ $1 -eq 0 ]; then
		read -p "Enter path to hostfile: " $hostfile
	else
		$hostfile = $1
	fi
else
	$portfile = $2
fi

# Check Ports
echo "host,port"


for host in $(cat $hostfile); do
	for port in $(cat $portfile); do
		timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
			echo "$host,$port"
	done
done
