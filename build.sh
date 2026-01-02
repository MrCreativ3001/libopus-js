#!/bin/sh
set -e

# Set up Emscripten environment
cd /emscrypten
. /emscrypten/emsdk_env.sh

# Build libopus
cd /libopus
./autogen.sh

cd /build
emconfigure /libopus/configure \
    --disable-asm \
    --disable-doc \
    --disable-extra-programs \
    --disable-stack-protector \
    --disable-shared \
    --enable-static \
    --disable-rtcd \
    --disable-dependency-tracking

emmake make -j$(nproc)

echo "libopus build successful"