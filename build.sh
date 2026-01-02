#!/bin/sh
set -e

emconfigure /libopus/configure \
    --disable-asm \
    --disable-encoder \
    --disable-doc \
    --disable-extra-programs \
    --disable-stack-protector \
    --disable-shared \
    --enable-static

emmake make -j$(nproc)