#!/usr/bin/env bash

if [ -f .env ] ; then source .env; else source .env.default; fi

sudo apt remove -y vim-tiny

sudo apt update && sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    vim \
    jq \
    openvpn \
    git \
    build-essential \
    -y

# git config
if [[ ! -z $GIT_USERNAME ]] ; then
    git config --global --replace-all user.name "${GIT_USERNAME}"
fi

if [[ ! -z $GIT_USEREMAIL ]] ; then
    git config --global --replace-all user.email "${GIT_USEREMAIL}"
fi

echo "git user configured to: $(git config --global --get user.email) / $(git config --global --get user.name)"

LOCAL_BIN="${HOME}/.local/bin"
mkdir -p $LOCAL_BIN
if [ $(cat ~/.bashrc | grep -c "$LOCAL_BIN:\$PATH") -lt 1 ] ; then
cat >> ~/.bashrc <<EOF
export PATH="$LOCAL_BIN:\$PATH"
EOF
fi

echo "added ${LOCAL_BIN} to path"

SETUP_SCRIPTS_DIR=${SETUP_SCRIPTS_DIR:-$HOME/setup-scripts}
if [ ! -d ${SETUP_SCRIPTS_DIR} ]; then
    git clone https://github.com/rolang/setup-scripts.git ${SETUP_SCRIPTS_DIR}
    echo "checked out scripts in ${SETUP_SCRIPTS_DIR}"
fi
