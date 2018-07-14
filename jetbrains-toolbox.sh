#!/usr/bin/env bash

if [ -f .env ] ; then source .env; else source .env.default; fi

JTB_LATEST=$(curl -s 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true' | jq ".TBA[0]")
JTB_VERSION=$(jq -r ".version" <<< $JTB_LATEST).$(jq -r ".build" <<< $JTB_LATEST)
JTB_DL_URL=$(jq -r ".downloads.linux.link" <<< $JTB_LATEST)

curl -SL ${JTB_DL_URL} -o /tmp/jtb.tar.gz
cd /tmp && tar xzvf jtb.tar.gz
jetbrains-toolbox-${JTB_VERSION}/jetbrains-toolbox &
rm -rf jtb*
