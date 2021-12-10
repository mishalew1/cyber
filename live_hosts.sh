#!/bin/bash

GREEN="\033[0;32m" 
RESTORE="\033[0m" 

# create a live_hosts file 
# which can be fed to nmap with the -iL option

# Get IP range from user
read -p "Enter IP or range example: 192.168.1.0/24 : " IP_address


# create directory if does not exist
dir=nmap_scans
[ -d $dir ] || mkdir $dir


# create date var to append to files
today=$(date +"%F-%I:%M%P")


# Nmap command with IP_address variable
# piped to awk to parse the IP's only
sudo nmap $IP_address -sn -oN $dir/ping_sweep_$today.txt \
	| awk '/Nmap scan/ {print $NF}' > $dir/live_hosts_$today.txt

echo "${GREEN}live_hosts DONE${RESTORE}"
