#!/bin/bash

mkdir lplinux && cd lplinux
wget https://lastpass.com/lplinux.tar.bz2
tar xjvf lplinux.tar.bz2
./install_lastpass.sh && cd .. && rm -rf lplinux
