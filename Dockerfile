FROM debian:bookworm-slim

VOLUME /libopus
VOLUME /build

RUN apt-get update && \
    apt-get install -y python3 git xz-utils curl autoconf automake libtool gcc make && \
    git clone https://github.com/emscripten-core/emsdk.git /emscrypten

WORKDIR /emscrypten

RUN ./emsdk install releases-e44d3cc557d78155966478aa2bd8dec657609619-64bit node-22.16.0-64bit && \
    ./emsdk activate releases-e44d3cc557d78155966478aa2bd8dec657609619-64bit node-22.16.0-64bit && \
    . ./emsdk_env.sh && \
    npm i typescript -g

COPY build.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]