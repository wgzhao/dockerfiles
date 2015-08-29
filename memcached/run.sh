#!/bin/bash
#run memcached
port=${PORT:-"10001"}
size=${SIZE:-"128"}
conn=${MAXCONN:-"1024"}
/usr/bin/memcached -u memcached -p $port -m $size -c $conn
#run openssh server
/usr/sbin/sshd -D
