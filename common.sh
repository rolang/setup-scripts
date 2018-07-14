#!/usr/bin/env bash

if [ -f .env ] ; then source .env; else source .env.default; fi

sudo apt remove -y vim-tiny

sudo apt install \
    vim \
    apt-transport-https \
    ca-certificates curl \
    software-properties-common \
    openvpn \
    git \
    gconf-service gconf-service-backend gconf2-common libgconf-2-4 \
    -y 

# git config
if [[ ! -z $GIT_USERNAME ]] ; then
    git config --global user.name ${GIT_USERNAME}
fi

if [[ ! -z $GIT_USEREMAIL ]] ; then
    git config --global user.email ${GIT_USEREMAIL}
fi

echo "git user configured to: $(git config --global --get user.email) / $(git config --global --get user.name)"
