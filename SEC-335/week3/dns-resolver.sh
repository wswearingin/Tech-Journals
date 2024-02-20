#!/bin/bash
# Resolves DNS names based on provided prefix and DNS server in a /24 network

# Get params
prefix=$1
server=$2

# Query DNS A records
for i in {1..254}; do
    nslookup $prefix.$i $server | grep "name ="
done
