#!/bin/bash

set -e

DIR=`pwd`
env
cat my_http_proxy.txt
export my_http_proxy=$(sed -n 1p  my_http_proxy.txt)
echo $my_http_proxy
