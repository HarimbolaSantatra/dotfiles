#!/usr/bin/env bash
set -e

# Github command line client
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

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

echo "Installing translate-shell ..."
# https://github.com/soimort/translate-shell
sudo apt install -y translate-shell

# cmake
sudo apt install -y cmake

# Install go
# https://go.dev/doc/install
wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
echo "fish_add_path \"/usr/local/go/bin\"" >> ~/.config/fish/conf.d/path.fish
go version
sudo snap install golangci-lint

# Install https://github.com/nektos/act
git clone https://github.com/nektos/act
cd act
make
sudo make install

# ripgrep: for telescope on neovim
sudo apt install ripgrep
