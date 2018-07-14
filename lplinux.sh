#!/usr/bin/env bash

LP_TMP_PATH=/tmp/lplinux

mkdir $LP_TMP_PATH && curl https://lastpass.com/lplinux.tar.bz2 -o $LP_TMP_PATH/src.tar.bz2
cd $LP_TMP_PATH && tar xjvf src.tar.bz2 && ./install_lastpass.sh
rm -rf $LP_TMP_PATH
