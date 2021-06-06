#!/usr/bin/env bash

set -e

CMAKE_VERSION="3.20.3"
CMAKE_RELEASE_NAME="cmake-${CMAKE_VERSION}-linux-x86_64"
CMAKE_RELEASE_DOWNLOAD_URL="https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/${CMAKE_RELEASE_NAME}.tar.gz"
CMAKE_DIST_DIR=~/cmake
CMAKE_RELEASE_DIR=${CMAKE_DIST_DIR}/${CMAKE_RELEASE_NAME}

function cmake_installed() {
  echo "$(cmake --version | grep version) is installed"
}

mkdir -p ${CMAKE_RELEASE_DIR}

if [ ! -f "${CMAKE_RELEASE_DIR}/bin/cmake" ] ; then
  echo "Downloading ${CMAKE_RELEASE_DOWNLOAD_URL}..."
  curl -L ${CMAKE_RELEASE_DOWNLOAD_URL} | tar zx -C ${CMAKE_RELEASE_DIR}/..
fi

sudo ln -sf ${CMAKE_RELEASE_DIR}/bin/cmake /usr/bin/cmake
cmake_installed
