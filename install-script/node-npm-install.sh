#!/bin/bash

curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs

sudo apt-get install -y npm

node -v
npm -v
