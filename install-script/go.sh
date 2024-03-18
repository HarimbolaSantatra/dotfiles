# Install go
# https://go.dev/doc/install
wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
echo "fish_add_path \"/usr/local/go/bin\"" >> ~/.config/fish/conf.d/path.fish
go version
sudo snap install golangci-lint

