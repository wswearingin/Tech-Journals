#!/bin/bash
# Scans entire /24 network for specified port

# Get network prefix and port to scan
prefix=$1
port=$2

# Check Hosts
for i in {1..254}
do
    host=$prefix"."$i
    timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
        echo $host
done
