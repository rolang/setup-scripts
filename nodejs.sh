#!/usr/bin/env bash

NVM_VERSION=$(curl -s 'https://api.github.com/repos/creationix/nvm/releases/latest' | jq -r '.tag_name')
curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install node && nvm use node
npm install npm@latest -g
