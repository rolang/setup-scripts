#!/usr/bin/env bash

set -e

SCALA_VERSION=$(curl -s 'https://api.github.com/repos/scala/scala/releases/latest' | jq .tag_name | grep -oE '[0-9\.]+')
SCALA_HOME=~/.scala

wget -O- https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xz -C ~/
rm -rf $SCALA_HOME
mv ~/scala-$SCALA_VERSION $SCALA_HOME

if [ $(cat ~/.bashrc | grep -c "$SCALA_HOME/bin:\$PATH") -lt 1 ] ; then
	echo "export PATH=\"$SCALA_HOME/bin:\$PATH\"" >> ~/.bashrc
	echo "$SCALA_HOME/bin added to PATH"
else
	echo "$SCALA_HOME/bin is already added to PATH"
fi

echo "Scala $SCALA_VERSION installed in $SCALA_HOME"
