#!/usr/bin/env bash

# Install typings
npm i -D @types/node

# Use yarn to install typescript
yarn global add typescript

# add to path
export PATH=~/.yarn/bin/:$PATH

echo "Do not forget to add ~/.yarn/bin/tsc to path permanently !"
