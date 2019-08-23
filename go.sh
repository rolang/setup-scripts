#!/usr/bin/env bash

source ./functions.sh

sudo snap install go --classic
add_to_bashrc 'export GOPATH="$HOME/go"'
add_to_bashrc 'export PATH="$GOPATH/bin:$PATH"'
