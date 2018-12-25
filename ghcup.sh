#!/usr/bin/env bash

GHCUP_HOME="\$HOME/.ghcup/bin"

(\
    mkdir -p ~/.ghcup/bin && \
    curl https://raw.githubusercontent.com/haskell/ghcup/master/ghcup > ~/.ghcup/bin/ghcup && \
    chmod +x ~/.ghcup/bin/ghcup \
) && echo "Success"

if [ $(cat ~/.bashrc | grep -c "$GHCUP_HOME:\$PATH") -lt 1 ] ; then
cat >> ~/.bashrc <<EOF
export PATH="\$HOME/.cabal/bin:$GHCUP_HOME:\$PATH"
EOF
fi
