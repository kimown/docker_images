#!/bin/bash

set -e

DIR=`pwd`

echo "build.sh"

export DEBIAN_FRONTEND=noninteractive
apt update && apt install -y nodejs xserver-xorg-core xorg kmod