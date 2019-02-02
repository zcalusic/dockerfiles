FROM zcalusic/debian-stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG MOOSEFS_VERSION

ENV MOOSEFS_VERSION $MOOSEFS_VERSION
ENV MOOSEFS_USER daemon
ENV MOOSEFS_GROUP daemon

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       file \
       gcc \
       libc6-dev \
       libfuse-dev \
       libpcap0.8-dev \
       make \
       pkg-config \
       python \
       zlib1g-dev \
    && mkdir -p /usr/src/moosefs \
    && wget --dot-style=mega -O- "https://github.com/moosefs/moosefs/archive/${MOOSEFS_VERSION}.tar.gz" | tar xz --strip-components=1 -C /usr/src/moosefs \
    && cd /usr/src/moosefs \
    && ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var/lib --with-default-user="$MOOSEFS_USER" --with-default-group="$MOOSEFS_GROUP" --disable-mfssupervisor --disable-mfscgiserv \
    && make -j$(nproc) install-strip

