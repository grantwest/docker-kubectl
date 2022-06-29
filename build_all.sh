#!/bin/bash 
set -ex

./build.sh 1.24.2 1.24 latest
./build.sh 1.23.8 1.23
./build.sh 1.22.11 1.22
