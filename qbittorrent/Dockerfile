FROM zcalusic/debian-trixie AS builder

ARG QBITTORRENT_VERSION
ARG LIBTORRENT_VERSION

ENV QBITTORRENT_VERSION=$QBITTORRENT_VERSION
ENV LIBTORRENT_VERSION=$LIBTORRENT_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       cmake \
       git \
       libboost-system-dev \
       libicu-dev \
       libssl-dev \
       ninja-build \
       qt6-base-private-dev \
       qt6-tools-dev \
       zlib1g-dev \
    && cd /usr/src \
    && git clone --branch "v$LIBTORRENT_VERSION" --depth 1 --recurse-submodules --shallow-submodules https://github.com/arvidn/libtorrent \
    && cd libtorrent \
    && cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    && cmake --build build --target install/strip \
    && cd /usr/src \
    && git clone --branch "release-$QBITTORRENT_VERSION" --depth 1 https://github.com/qbittorrent/qBittorrent \
    && cd qBittorrent \
    && cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DGUI=OFF -DSTACKTRACE=OFF \
    && cmake --build build --target install/strip \
    && gzip -9 /usr/share/man/man1/qbittorrent-nox.1

FROM zcalusic/debian-trixie

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libeatmydata1 \
       libqt6network6 \
       libqt6sql6 \
       libqt6xml6 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/lib/x86_64-linux-gnu/libtorrent-rasterbar.so.*.*.* /usr/lib/x86_64-linux-gnu

RUN ldconfig

COPY --from=builder /usr/bin/qbittorrent-nox /usr/bin/qbittorrent-nox
COPY --from=builder /usr/share/man/man1/qbittorrent-nox.1.gz /usr/share/man/man1/qbittorrent-nox.1.gz

COPY qBittorrent.conf /etc/qBittorrent.conf

EXPOSE 8080 8999

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
