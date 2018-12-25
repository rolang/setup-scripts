#!/usr/bin/env bash

set -e

GHCUP_HOME=$HOME/.ghcup/bin

mkdir -p ~/.ghcup/bin
curl -s https://raw.githubusercontent.com/haskell/ghcup/master/ghcup > $GHCUP_HOME/ghcup
chmod +x $GHCUP_HOME/ghcup

if [ $(cat ~/.bashrc | grep -c "$GHCUP_HOME:\$PATH") -lt 1 ] ; then
cat >> ~/.bashrc <<EOF
export PATH="\$HOME/.cabal/bin:$GHCUP_HOME:\$PATH"
EOF
fi

echo "Installed in $GHCUP_HOME"
$GHCUP_HOME/ghcup -h
