#!/usr/bin/env bash
installed_ver=$(python --version)
used_ver="3.10"
echo "Set python version variable."
echo "Current one is: $ver"

sudo apt-get update

# Install python debugger
sudo apt install python-dev-is-python3

# Install python virtual environment (venv)
sudo apt install -y python${used_ver}-venv
