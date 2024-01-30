# Installation tutorial: https://classic.yarnpkg.com/lang/en/docs/install/#debian-stable
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Installation
sudo apt update && sudo apt install yarn

# Check instllation
printf "Yarn version: ..."
yarn --version
