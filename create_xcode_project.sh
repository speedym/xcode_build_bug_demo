#!/usr/bin/env bash

set -euo pipefail

build_dir=build/macos_xcode

cmake \
    -S . \
    -B $build_dir \
    -G Xcode \
    -D CMAKE_OSX_DEPLOYMENT_TARGET="10.15" \
    -D CMAKE_XCODE_GENERATE_SCHEME=OFF

cmake --open $build_dir
