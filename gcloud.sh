#!/usr/bin/env bash

source ./functions.sh

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt update && sudo apt install google-cloud-sdk kubectl -y

curl -s https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -o ~/.local/bin/cloud_sql_proxy && chmod +x ~/.local/bin/cloud_sql_proxy
echo "Installed $(cloud_sql_proxy --version)"

add_to_bashrc "source <(kubectl completion bash)"

