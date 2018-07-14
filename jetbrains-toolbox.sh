#!/usr/bin/env bash

if [ -f .env ] ; then source .env; else source .env.default; fi

wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-${JETBRAINS_TB_VERSION}.tar.gz
tar xzvf jetbrains-toolbox-${JETBRAINS_TB_VERSION}.tar.gz
mv jetbrains-toolbox-${JETBRAINS_TB_VERSION}/jetbrains-toolbox ~/jetbrains-toolbox
rm -rf jetbrains-toolbox-*
~/jetbrains-toolbox &
