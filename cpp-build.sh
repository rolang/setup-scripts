#!/usr/bin/env bash

set -e

# install clang
CODE=$(lsb_release -cs)
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo add-apt-repository "deb http://apt.llvm.org/${CODE}/ llvm-toolchain-${CODE} main"
sudo apt-get update && sudo apt-get install clang lldb lld rsync gdb -y

# install cmake
CMAKE_RELEASE=$(curl -s https://api.github.com/repos/Kitware/CMake/releases/latest | jq -r '.assets[] | select(contains({"browser_download_url": "Linux-x86_64.tar.gz"}))')
CMAKE_RELEASE_NAME=$(echo $CMAKE_RELEASE | jq -r '.name | rtrimstr(".tar.gz")')
CMAKE_RELEASE_DOWNLOAD_URL=$(echo $CMAKE_RELEASE | jq -r .browser_download_url)
CMAKE_DIST_DIR=~/cmake
CMAKE_RELEASE_DIR=${CMAKE_DIST_DIR}/${CMAKE_RELEASE_NAME}

function cmake_installed() {
  echo "$(cmake --version | grep version) is installed"
}

mkdir -p ${CMAKE_DIST_DIR}

if [ ! -d "${CMAKE_RELEASE_DIR}" ] ; then
  echo "Downloading ${CMAKE_RELEASE_DOWNLOAD_URL}..."
  curl -L ${CMAKE_RELEASE_DOWNLOAD_URL} | tar zx -C ${CMAKE_DIST_DIR}
fi

sudo ln -sf ${CMAKE_RELEASE_DIR}/bin/cmake /usr/bin/cmake
cmake_installed

# install ninja
NINJA_URL=$(curl -s https://api.github.com/repos/ninja-build/ninja/releases/latest | jq -r '.assets[] | select(.name == "ninja-linux.zip").browser_download_url')
curl -sL ${NINJA_URL} -o ninja.zip && \
unzip ninja.zip && rm ninja.zip && sudo mv ninja /usr/bin/ninja
echo "ninja $(ninja --version) installed"
