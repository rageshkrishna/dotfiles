#!/bin/bash -e

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
source ~/.nvm/nvm.sh
nvm install node
npm install -g jshint grunt-cli
