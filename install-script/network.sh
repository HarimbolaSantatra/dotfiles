#!/usr/bin/env bash
set -e
sudo apt-get update
# net-tools: arp, ifconfig, route, netstat
sudo apt install net-tools
# Nmap
sudo apt-get install -y nmap
# traceroute
sudo apt install inetutils-traceroute
# netcat
sudo apt install -y netcat

# wireshark
sudo apt install -y wireshark
# If you want to use tshark:
# sudo apt install -y tshark
# Set wireshark to run as nonroot
sudo usermod -aG wireshark santatra
sudo chgrp wireshark $(which dumpcap)
sudo chmod 4750 $(which dumpcap)
