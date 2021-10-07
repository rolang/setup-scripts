#!/usr/bin/env bash

set -e

source ./functions.sh

SCALA_VERSION=2.13.6 

# latest release
# SCALA_VERSION=$(curl -s 'https://api.github.com/repos/scala/scala/releases/latest' | jq .tag_name | grep -oE '[0-9\.]+')

SCALA_HOME=~/.scala

wget -O- https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xz -C ~/
rm -rf $SCALA_HOME
mv ~/scala-$SCALA_VERSION $SCALA_HOME
ln -sf $SCALA_HOME/bin/* ~/.local/bin/

echo "Scala $SCALA_VERSION installed in $SCALA_HOME"
