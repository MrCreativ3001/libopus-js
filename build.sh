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

emcc /build/.libs/libopus.a \
    -o libopus.js \
    -s MODULARIZE=1 \
    -s EXPORT_ES6=1 \
    -s EXPORTED_FUNCTIONS="['_malloc','_free','_opus_multistream_decoder_create','_opus_multistream_decode_float','_opus_multistream_decoder_destroy']" \
    -s EXPORTED_RUNTIME_METHODS="['cwrap','ccall','stackAlloc','stackSave','stackRestore','setValue','getValue','writeArrayToMemory','HEAPU8','HEAPF32']" \
    --emit-tsd libopus.d.ts

echo "libopus build successful"