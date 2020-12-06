#!/bin/bash

set -e

DIR=`pwd`

echo "build.sh"

export DEBIAN_FRONTEND=noninteractive
apt update
apt install -y xserver-xorg-core xorg kmod
apt install -y nodejs
apt install -y mesa-utils