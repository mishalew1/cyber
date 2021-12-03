#!/bin/bash

# automate live hosts file

sudo nmap -sn 192.168.2.0/24 -oA ping_sweep | awk '/Nmap scan/ {print $NF}' > live_hosts2
