#!/usr/bin/env bash

source ./functions.sh

curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | BINDIR=~/.local/bin bash

add_to_bashrc "alias tfswitch='tfswitch -b ${HOME}/.local/bin/terraform'"
