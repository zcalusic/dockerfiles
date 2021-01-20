FROM zcalusic/debian-bullseye as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG QBITTORRENT_VERSION
ARG LIBTORRENT_VERSION

ENV QBITTORRENT_VERSION $QBITTORRENT_VERSION
ENV LIBTORRENT_VERSION $LIBTORRENT_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       automake \
       build-essential \
       cmake \
       git \
       libboost-system-dev \
       libicu-dev \
       libssl-dev \
       libtool \
       pkg-config \
       qtbase5-dev \
       qttools5-dev-tools \
       zlib1g-dev \
    && MAKEFLAGS="-j $(nproc)" \
    && export MAKEFLAGS \
    && cd /usr/src \
    && git clone --branch v$LIBTORRENT_VERSION --depth 1 https://github.com/arvidn/libtorrent \
    && cd libtorrent \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=17 -DCMAKE_INSTALL_PREFIX=/usr -G "Unix Makefiles" .. \
    && make install/strip \
    && cd /usr/src \
    && git clone --branch release-$QBITTORRENT_VERSION --depth 1 https://github.com/qbittorrent/qBittorrent \
    && cd /usr/src/qBittorrent \
    && ./bootstrap.sh \
    && ./configure --prefix=/usr --disable-gui \
    && make install \
    && gzip -9 /usr/share/man/man1/qbittorrent-nox.1

FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG LIBTORRENT_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libqt5network5 \
       libqt5xml5 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/lib/x86_64-linux-gnu/libtorrent-rasterbar.so.$LIBTORRENT_VERSION /usr/lib/x86_64-linux-gnu/libtorrent-rasterbar.so.$LIBTORRENT_VERSION

RUN ldconfig

COPY --from=builder /usr/bin/qbittorrent-nox /usr/bin/qbittorrent-nox
COPY --from=builder /usr/share/man/man1/qbittorrent-nox.1.gz /usr/share/man/man1/qbittorrent-nox.1.gz

COPY qBittorrent.conf /etc/qBittorrent.conf

EXPOSE 8080 8999

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
