#!/usr/bin/env bash

CMAKE_RELEASE=$(curl -s https://api.github.com/repos/Kitware/CMake/releases/latest | jq -r '.assets[] | select(contains({"browser_download_url": "Linux-x86_64.tar.gz"}))')
CMAKE_RELEASE_NAME=$(echo $CMAKE_RELEASE | jq -r '.name | rtrimstr(".tar.gz")')
CMAKE_RELEASE_DOWNLOAD_URL=$(echo $CMAKE_RELEASE | jq -r .browser_download_url)
CMAKE_DIST_DIR=~/cmake
CMAKE_RELEASE_DIR=${CMAKE_DIST_DIR}/${CMAKE_RELEASE_NAME}

function echo_done() {
  echo "$(cmake --version | grep version) is installed"
}

mkdir -p ${CMAKE_DIST_DIR}

if [ -d "${CMAKE_RELEASE_DIR}" ] ; then
  echo_done
else
  echo "Downloading ${CMAKE_RELEASE_DOWNLOAD_URL}..."
  curl -L ${CMAKE_RELEASE_DOWNLOAD_URL} | tar zx -C ${CMAKE_DIST_DIR}
fi

ln -sf ${CMAKE_RELEASE_DIR}/bin/cmake ~/.local/bin/cmake
echo_done
