#!/bin/bash

set -e
set -x

rm -rf testapp/build
mkdir -p testapp/build

pip install wheel
python setup.py bdist_wheel 
pip install conan

conan install ..
cmake ../src/ -DCMAKE_BUILD_TYPE=Release
cmake --build .

bin/testapp
