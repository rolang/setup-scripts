#!/usr/bin/env bash

set -e

CMAKE_VERSION="3.20.3"
CMAKE_RELEASE=$(curl -s https://api.github.com/repos/Kitware/CMake/releases/tags/v${CMAKE_VERSION} | jq -r '.assets[] | select(contains({"browser_download_url": "linux-x86_64.tar.gz"}))')
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
