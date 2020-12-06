#!/bin/bash

set -e

DIR=`pwd`

echo "build.sh"

export DEBIAN_FRONTEND=noninteractive
apt update
apt install -y xserver-xorg-core xorg kmod

apt install -y nodejs npm
npm config set registry 'https://registry.npm.taobao.org'
npm i pm2 -g

apt install -y mesa-utils