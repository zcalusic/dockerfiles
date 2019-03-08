FROM zcalusic/debian-buster as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG TRANSMISSION_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       cmake \
       g++ \
       git \
       libcurl4-gnutls-dev \
       libevent-dev \
       libssl-dev \
       make \
       patch \
       zlib1g-dev \
    && cd /usr/src \
    && git clone https://github.com/transmission/transmission \
    && cd transmission \
    && git checkout ${TRANSMISSION_VERSION} \
    && mkdir build \
    && cd build \
    && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr .. \
    && make -j "$(nproc)" install/strip \
    && gzip -9 /usr/share/man/man1/transmission-daemon.1

FROM zcalusic/debian-buster
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Transmission in Docker" \
      org.label-schema.description="Run Transmission BitTorrent client in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libcurl3-gnutls \
       libevent-2.1-6 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/bin/transmission-daemon /usr/bin/transmission-daemon
COPY --from=builder /usr/share/man/man1/transmission-daemon.1.gz /usr/share/man/man1/transmission-daemon.1.gz
COPY --from=builder /usr/share/transmission/web /usr/share/transmission/web

EXPOSE 9091 51413 51413/udp

CMD [ "transmission-daemon", "-f", "-g", "/config", "-w", "/data", "--no-portmap", "--log-info" ]
