#!/usr/bin/env bash

if [ -f .env ] ; then source .env; else source .env.default; fi

curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | sudo -E bash -
sudo apt install -y nodejs
