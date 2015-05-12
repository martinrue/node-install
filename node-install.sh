#!/bin/bash

function getDownloadUrl {
  local version=$1
  echo "http://nodejs.org/dist/v$version/node-v$version-linux-x64.tar.gz"
}

function installVersion {
  local version=$1
  local install_path="$2/v$version"
  local url=$(getDownloadUrl $version)

  echo "installing: $version"
  curl -sf $url -o "$version.tar.gz"

  if [ $? -eq 0 ]; then
    if [ -d "$install_path" ]; then
      rm -rf "$install_path"
    fi

    tar xfz "$version.tar.gz" && mv "node-v$version-linux-x64" "$install_path"
    rm "$version.tar.gz"
  else
    echo "error: failed to install $version from $url"
  fi
}

# what are we installing, and to where?
read -p "enter install path (/node): " install_path
read -p "enter node versions to install: " install_versions

# exit if no versions entered
if [ -z "$install_versions" ]; then
  exit 0
fi

# fall back to /node for install dir
IFS=" " versions=($install_versions)
install_path=${install_path:-"/node"}

# create install dir
if [ ! -d "$install_path" ]; then
  mkdir -p "$install_path"
fi

# install each requested version
for version in "${versions[@]}"; do
  installVersion $version $install_path
done
