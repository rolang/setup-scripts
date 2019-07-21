#!/usr/bin/env bash

DOCKER_COMPOSE_VERSION=$(curl -s 'https://api.github.com/repos/docker/compose/releases/latest' | jq -r '.tag_name')

echo "installing docker-compose version ${DOCKER_COMPOSE_VERSION}"

sudo curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose ~/.local/bin/dc
docker-compose --version
