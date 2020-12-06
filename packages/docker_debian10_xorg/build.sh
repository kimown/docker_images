#!/bin/bash

set -e

DIR=`pwd`

echo "build.sh"

export DEBIAN_FRONTEND=noninteractive
apt install -y nodejs xserver-xorg-core xorg kmod