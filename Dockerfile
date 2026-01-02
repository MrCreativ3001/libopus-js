FROM debian:bookworm-slim

VOLUME /libopus
VOLUME /build

RUN apt-get update && \
    apt-get install -y python3 git xz-utils curl autoconf automake libtool gcc make && \
    git clone https://github.com/emscripten-core/emsdk.git /emscrypten

WORKDIR /emscrypten

RUN ./emsdk install latest && \
    ./emsdk activate latest

COPY build.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]