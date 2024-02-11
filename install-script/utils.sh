#!/usr/bin/env bash
echo "Installing figlet ..."
sudo apt-get install -y figlet

echo "Installing thefuck ..."
sudo apt install python3-dev python3-pip python3-setuptools
pip3 install thefuck --user

echo "Installing hugo ..."
sudo snap install hugo
# Also work: sudo apt install hugo
