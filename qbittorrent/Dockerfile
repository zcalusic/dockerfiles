FROM zcalusic/debian-buster as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ENV QBITTORRENT_VERSION 4.2.1
ENV LIBTORRENT_VERSION 1.2.4

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       automake \
       build-essential \
       git \
       libboost-system-dev \
       libssl-dev \
       libtool \
       pkg-config \
       qtbase5-dev \
       qttools5-dev-tools \
       zlib1g-dev \
    && cd /usr/src \
    && git clone https://github.com/arvidn/libtorrent \
    && cd libtorrent \
    && git checkout libtorrent-$(echo ${LIBTORRENT_VERSION} | sed 's/\./_/g') \
    && ./bootstrap.sh --prefix=/usr --libdir=/usr/lib/x86_64-linux-gnu \
    && make -j $(nproc) install-strip \
    && cd /usr/src \
    && git clone https://github.com/qbittorrent/qBittorrent \
    && cd qBittorrent \
    && git checkout release-${QBITTORRENT_VERSION} \
    && ./bootstrap.sh \
    && ./configure --prefix=/usr --disable-gui \
    && make -j $(nproc) install \
    && gzip -9 /usr/share/man/man1/qbittorrent-nox.1

FROM zcalusic/debian-buster
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="qBittorrent in Docker" \
      org.label-schema.description="Run qBittorrent BitTorrent client in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libboost-system1.67.0 \
       libqt5network5 \
       libqt5xml5 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/lib/x86_64-linux-gnu/libtorrent-rasterbar.so.10.0.0 /usr/lib/x86_64-linux-gnu/libtorrent-rasterbar.so.10.0.0

RUN ldconfig

COPY --from=builder /usr/bin/qbittorrent-nox /usr/bin/qbittorrent-nox
COPY --from=builder /usr/share/man/man1/qbittorrent-nox.1.gz /usr/share/man/man1/qbittorrent-nox.1.gz

COPY qBittorrent.conf /etc/qBittorrent.conf

EXPOSE 8080 8999

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
