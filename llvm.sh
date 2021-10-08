#!/usr/bin/env bash

VERSION=13
CODE=$(lsb_release -cs)
curl -s https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo add-apt-repository "deb http://apt.llvm.org/${CODE}/ llvm-toolchain-${CODE}-${VERSION} main"

sudo apt-get update && sudo apt-get install clang-${VERSION} lldb-${VERSION} lld-${VERSION} -y && \
  sudo ln -sf /usr/bin/clang-${VERSION} /usr/bin/clang && \
  sudo ln -sf /usr/bin/clang++-${VERSION} /usr/bin/clang++

