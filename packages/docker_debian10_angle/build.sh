#!/bin/bash

set -e

DIR=`pwd`

echo "build.sh"
apt update 
apt-get install sudo lsb-release -y

git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH="$PATH:$PWD/depot_tools"
echo "export PATH=$PWD/depot_tools:$PATH" >>~/.bashrc
source ~/.bashrc

git clone https://github.com/kimown/angle.git
cd angle
python scripts/bootstrap.py
gclient sync
./tools/flex-bison/linux/bison --help

git checkout master
gclient sync

git checkout mybranch
gclient sync
./build/install-build-deps.sh --no-arm --no-chromeos-fonts
vi ./build/install-build-deps.sh

gn gen out/Debug
cat <<EOF > out/Debug/args.gn
angle_shared_libvulkan = true
angle_enable_vulkan = true
angle_enable_vulkan_validation_layers = true
angle_enable_gl = false
angle_enable_swiftshader = false
enable_dsyms = false
build_angle_deqp_tests = false
EOF

gn args out/Debug/
ninja -C out/Debug

./out/Debug/angle_end2end_tests

python2 scripts/run_code_generation.py
