#!/bin/bash

hostfile=$1
portfile=$2

while ! [ -f "$hostfile" ]; do
	read -p "Enter path to hostfile: " $hostfile
done

while ! [ -f "$portfile" ]; do
	read -p "Enter path to portfile: " $portfile
done

echo "host,port"


for host in $(cat $hostfile); do
	for port in $(cat $hostfile); do
		timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
			echo "$host,$port"
	done
done