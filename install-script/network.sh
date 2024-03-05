#!/usr/bin/env bash
set -e
sudo apt-get update
# Nmap
sudo apt-get install -y nmap
# netcat and wireshark
sudo apt-get install -y netcat wireshark
# traceroute
sudo apt install inetutils-traceroute
