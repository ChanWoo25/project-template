#! /bin/bash
#* Author: Chanwoo Lee
#* Git User: https://github.com/ChanWoo25
#* Target Version Example: 3.24.3,

# TODO


function install_cmake_in_local() {
  local target_version=$1
  echo "Install CMake ${target_version} in local environment..."

  cd ~
  echo "check_certificate = off" >> ~/.wgetrc &&\
  wget -O cmake.sh https://github.com/Kitware/CMake/releases/download/v${target_version}/cmake-${target_version}-Linux-x86_64.sh
  chmod +x cmake.sh
  sudo ./cmake.sh --prefix=/usr/local --exclude-subdir
  rm cmake.sh
}

function install_cmake_in_docker() {
  local target_version=$1
  echo "Install CMake ${target_version} in docker container ..."

  cd ~
  echo "check_certificate = off" >> ~/.wgetrc &&\
  wget -O cmake.sh https://github.com/Kitware/CMake/releases/download/v${target_version}/cmake-${target_version}-Linux-x86_64.sh
  chmod +x cmake.sh
  bash cmake.sh --prefix=/usr/local --exclude-subdir
  rm cmake.sh
}

# Arguments check
if [ $# -lt 2 ]; then
  echo "Example: install-cmake.sh <local or docker> <target_version>"
  exit 1
fi

MODE=$1
TARGET_VERSION=$2

cd ~

case $MODE in
  "local")
    install_cmake_in_local "$TARGET_VERSION"
    ;;
  "docker")
    install_cmake_in_docker "$TARGET_VERSION"
    ;;
  *)
    echo "Wrong function name !!"
    exit 1
    ;;
esac

exit 0
