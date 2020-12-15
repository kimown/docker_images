#!/bin/bash

set -e

DIR=`pwd`
env

setProxy(){
#    export http_proxy=localhost:8888  https_proxy=localhost:8888
    export http_proxy=${MY_HTTP_PROXY}  https_proxy=${MY_HTTP_PROXY}
    echo "setProxy"
    echo $http_proxy
    echo $https_proxy
}

unsetProxy(){
    unset http_proxy https_proxy
    echo "unsetProxy"
}

echo "build.sh"
apt update 


setProxy
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

unsetProxy
apt-get install sudo lsb-release -y
./build/install-build-deps.sh --no-arm --no-chromeos-fonts || echo "no"

gn gen out/Debug
cat <<EOF > out/Debug/args.gn
angle_shared_libvulkan = true
angle_enable_vulkan = true
angle_enable_vulkan_validation_layers = true
angle_enable_gl = true
angle_enable_swiftshader = false
enable_dsyms = false
build_angle_deqp_tests = false
EOF

#gn args out/Debug/
setProxy
ninja -C out/Debug

./out/Debug/angle_end2end_tests || echo "test"

#python2 scripts/run_code_generation.py

#cd ..
#tar -czvf angle-linux-x64.tar.gz angle/out/Debug/*.so angle/include/
#npm i http-server -g

