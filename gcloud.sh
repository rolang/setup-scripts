#!/usr/bin/env bash

source ./functions.sh

if [ ! -f "/etc/apt/sources.list.d/google-cloud-sdk.list" ]; then
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
fi

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt install google-cloud-sdk

add_to_bashrc "source <(kubectl completion bash)"

