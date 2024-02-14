#!/bin/bash
hostfile=""
portfile=""

# Get host/port file
if [! $# -eq 0 ]; then
	$hostfile=$1
	$portfile=$2
else
	read -p "Enter path to hostfile: " $hostfile
	read -p "Enter path to portfile: " $portfile
fi

# Check Ports
echo "host,port"


for host in $(cat $hostfile); do
	for port in $(cat $portfile); do
		timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
			echo "$host,$port"
	done
done
