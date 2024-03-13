#!/usr/bin/env bash
set -e
sudo apt-get update
# net-tools: arp, ifconfig, route, netstat
sudo apt install net-tools
# Nmap
sudo apt-get install -y nmap
# netcat and wireshark
sudo apt install -y netcat wireshark
# traceroute
sudo apt install inetutils-traceroute
