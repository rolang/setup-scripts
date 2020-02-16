#!/usr/bin/env bash

if [ -f .env ] ; then source .env; else source .env.default; fi

add_to_bashrc() {
  if [ $(cat ~/.bashrc | grep -c "$1") -lt 1 ]; then echo "$1" >> ~/.bashrc; fi
}

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
add_to_bashrc "export PATH=\"$LOCAL_BIN:\$PATH\""
add_to_bashrc "fish"

# https://github.com/microsoft/vscode/issues/48480#issuecomment-413793736
if [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
  add_to_bashrc "export GTK_IM_MODULE=xim"
fi

SETUP_SCRIPTS_DIR=${SETUP_SCRIPTS_DIR:-$HOME/setup-scripts}
if [ ! -d ${SETUP_SCRIPTS_DIR} ]; then
    git clone https://github.com/rolang/setup-scripts.git ${SETUP_SCRIPTS_DIR}
    echo "checked out scripts in ${SETUP_SCRIPTS_DIR}"
fi
