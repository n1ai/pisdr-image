#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/Software"
cd 		    "/home/${FIRST_USER_NAME}/Software"

if [ ! -d "dsdcc" ]; then
    git clone https://github.com/f4exb/dsdcc.git
fi

cd dsdcc
git pull
git reset --hard "v1.8.6"
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake -DUSE_MBELIB=ON  ../
make -j$(nproc) install
ldconfig
EOF