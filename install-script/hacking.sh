#!/usr/bin/env bash
set -e
sudo apt update
# John the ripper
sudo apt-get install john -y

# gobuster
go install github.com/OJ/gobuster/v3@latest
