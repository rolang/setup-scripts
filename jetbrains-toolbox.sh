#!/bin/bash
JETBRAINS_TB_VERSION=1.9.3935
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-${JETBRAINS_TB_VERSION}.tar.gz
tar xzvf jetbrains-toolbox-${JETBRAINS_TB_VERSION}.tar.gz
mv jetbrains-toolbox-${JETBRAINS_TB_VERSION}/jetbrains-toolbox ~/jetbrains-toolbox
rm -rf jetbrains-toolbox-*
~/jetbrains-toolbox &
