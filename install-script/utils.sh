#!/usr/bin/env bash
echo "Install fzf and zoxide"
# Source: https://github.com/junegunn/fzf?tab=readme-ov-file#using-git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# Source: https://github.com/ajeetdsouza/zoxide
sudo apt install -y zoxide


echo "Installing figlet ..."
sudo apt-get install -y figlet

echo "Installing thefuck ..."
sudo apt install python3-dev python3-pip python3-setuptools
pip3 install thefuck --user

echo "Installing hugo ..."
sudo snap install hugo
# Also work: sudo apt install hugo
