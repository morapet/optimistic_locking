#!/bin/bash

set -e
set -x

rm -rf testapp/build
mkdir -p testapp/build

sudo apt-get install gcc libpq-dev -y
sudo apt-get install python-dev  python-pip -y
sudo apt-get install python3-dev python3-pip python3-venv python3-wheel -y

rm -rf env
mkdir -p env

pip3 install -U pip
pip3 install setuptools
pip3 install wheel

python3 -m pip install --user virtualenv

python3 -m venv env

source env/bin/activate

pip3 install conan
pip3 install setuptools
pip3 install wheel

conan install ..
cmake ../src/ -DCMAKE_BUILD_TYPE=Release
cmake --build .

bin/testapp
