#!/usr/bin/env bash

curl https://sh.rustup.rs -sSf | sh

# add cargo to path
if [ $(cat ~/.bashrc | grep -c ".cargo/bin:\$PATH") -lt 1 ] ; then
cat >> ~/.bashrc <<EOF
export PATH="$HOME/.cargo/bin:\$PATH"
EOF
fi

