#!/bin/bash

set -e

export DIR=`pwd`
env
export my_http_proxy=$(sed -n 1p  my_http_proxy.txt)

setProxy(){
#    export http_proxy=localhost:8888  https_proxy=localhost:8888
    export http_proxy=${my_http_proxy}  https_proxy=${my_http_proxy}
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

cd /docker_debian10_skia
git clone https://skia.googlesource.com/skia.git
cd skia

git checkout 0922403dcdc6b9ea70d39149a3a67295034f14ca
git checkout -b nodev1 0922403dcdc6b9ea70d39149a3a67295034f14ca
git checkout nodev1

cp /docker_debian10_skia/enable_gpu_render_skottie_v1/skottie2movie.cpp tools/skottie2movie.cpp

python2 tools/git-sync-deps
unsetProxy

sudo apt-get update && sudo apt -y install build-essential freeglut3-dev libfontconfig-dev libfreetype6-dev libgif-dev libgl1-mesa-dev libglu1-mesa-dev libharfbuzz-dev libicu-dev libjpeg-dev libpng-dev libwebp-dev 
sudo apt -y install clang
clang -v
bin/gn gen out/Static --args='skia_use_egl=true skia_use_ffmpeg=true cc="clang" cxx="clang++" extra_cflags_cc=["-fno-exceptions","-fexceptions"]'
python --version
sudo apt -y install libavutil-dev libavformat-dev libswscale-dev libavcodec-dev
pkg-config --libs libavcodec libavformat libswscale libavutil

ninja -C out/Static skottie2movie 
ninja -C out/Static skottie_tool


./out/Static/skottie2movie || echo "skottie2movie"
./out/Static/skottie_tool || echo "skottie_tool"

