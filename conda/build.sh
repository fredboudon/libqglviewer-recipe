#!/bin/bash

set -x -e

#export CXXFLAGS=""
#export LINKFLAGS=""

if [ "$(uname)" == "Darwin" ];
then
    #export CC=clang
    #export CXX=clang++

    #export MACOSX_VERSION_MIN=10.9
    #export QMAKESPEC=macx-clang
	
	#CXXFLAGS="${CXXFLAGS} -stdlib=libc++ -mmacosx-version-min=${MACOSX_VERSION_MIN}"
    LDFLAGS="${LDFLAGS} -undefined dynamic_lookup"

fi

if [ "$(uname)" == "Linux" ];
then
    export QMAKESPEC=linux-g++
fi

[[ -d build ]] || mkdir build
cd build

env

qmake ../libQGLViewer.pro \
    PREFIX="${PREFIX}"             \
    QTC_PREFIX="${PREFIX}"             \
    QBS_INSTALL_PREFIX="${PREFIX}"     \
    LLVM_INSTALL_DIR="${PREFIX}"       \
    QMAKE_CC=${CC} \
    QMAKE_CXX=${CXX} \
    QMAKE_LINK=${CXX} \
    QMAKE_RANLIB=${RANLIB} \
    QMAKE_OBJDUMP=${OBJDUMP} \
    QMAKE_STRIP=${STRIP} \
    QMAKE_AR_CMD="${AR} cqs" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"
    QMAKE_CFLAGS_RELEASE="${CFLAGS}"
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
    QT_SYSROOT="${CONDA_BUILD_SYSROOT}" \
    QMAKE_MAC_SDK.macosx.Path="${CONDA_BUILD_SYSROOT}" \
    QMAKE_MACOSX_DEPLOYMENT_TARGET="${MACOSX_DEPLOYMENT_TARGET}" \
    

make
make install
cd ..
