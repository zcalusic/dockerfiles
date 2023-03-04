FROM zcalusic/debian-bullseye as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG DYNOMITE_VERSION

COPY patches /usr/local/src/patches

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       automake \
       gcc \
       git \
       libc6-dev \
       libssl-dev \
       libtool \
       make \
       patch \
    && MAKEFLAGS="-j $(nproc)" \
    && export MAKEFLAGS \
    && cd /usr/local/src \
    && git clone --branch "$DYNOMITE_VERSION" --depth 1 https://github.com/Netflix/dynomite \
    && cd dynomite \
    && patch -p1 < /usr/local/src/patches/01-gcc-10-fix.patch \
    && patch -p1 < /usr/local/src/patches/02-stop-log-spam.patch \
    && patch -p1 < /usr/local/src/patches/03-fix-memory-leak.patch \
    && autoreconf -fvi \
    && ./configure \
    && make install-strip

FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN apt-get update \
    && apt-get install -y --no-install-recommends binutils \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /conf

COPY --from=builder /usr/local/sbin/dynomite /usr/sbin/dynomite
COPY --from=builder /usr/local/sbin/dynomite-test /usr/sbin/dynomite-test
COPY --from=builder /usr/local/bin/dynomite-hash-tool /usr/bin/dynomite-hash-tool
COPY --from=builder /usr/local/src/dynomite/conf /conf

COPY dynomite.yml /conf/dynomite.yml

STOPSIGNAL SIGKILL

EXPOSE 8101 8102 22222

CMD [ "dynomite" ]
