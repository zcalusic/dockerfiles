FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Build Linux kernel Debian package" \
      org.label-schema.description="A Docker container used to build Linux kernel Debian package" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       libisl-dev \
       libmpc-dev \
    && mkdir -p /usr/src/gcc \
    && wget --dot-style=mega -O- https://ftp.gwdg.de/pub/misc/gcc/snapshots/7.3.0-RC-20180122/gcc-7.3.0-RC-20180122.tar.xz | tar xJ --strip-components=1 -C /usr/src/gcc \
    && cd /usr/src/gcc \
    && ./configure --build="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" --disable-multilib --enable-languages=c \
    && make -j "$(nproc)" \
    && make install-strip \
    && cd / \
    && rm -rf /usr/src/gcc \
    && apt-get purge -y \
       build-essential \
       libisl-dev \
       libmpc-dev \
    && apt-get autoremove -y --purge \
    && apt-get install -y --no-install-recommends \
       bc \
       dpkg-dev \
       fakeroot \
       libc6-dev \
       libelf-dev \
       libisl15 \
       libmpc3 \
    && rm -rf /var/lib/apt/lists/*

COPY build.sh /build.sh
COPY config /tmp/config
COPY builddeb /tmp/builddeb
