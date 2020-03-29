#!/bin/bash

set -e
set -x

rm -rf testapp/build
mkdir testapp/build

pip install conan

conan install ..
cmake ../src/ -DCMAKE_BUILD_TYPE=Release
cmake --build .

bin/testapp
