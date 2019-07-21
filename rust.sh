#!/usr/bin/env bash

source ./functions.sh

curl https://sh.rustup.rs -sSf | sh

# add cargo to path
add_to_bashrc 'export PATH="$HOME/.cargo/bin:\$PATH"'

