FROM zcalusic/debian-bookworm as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG MOOSEFS_VERSION

ENV MOOSEFS_VERSION $MOOSEFS_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       file \
       fuse3 \
       gcc \
       libc6-dev \
       libfuse3-dev \
       libpcap0.8 \
       libpcap0.8-dev \
       make \
       pkgconf \
       python-is-python3 \
       zlib1g-dev \
    && MAKEFLAGS="-j $(nproc)" \
    && export MAKEFLAGS \
    && mkdir -p /usr/src/moosefs \
    && wget --dot-style=mega -O- "https://github.com/moosefs/moosefs/archive/${MOOSEFS_VERSION}.tar.gz" | tar xz --strip-components=1 -C /usr/src/moosefs \
    && cd /usr/src/moosefs \
    && ./configure --prefix=/usr --libdir=/usr/lib/x86_64-linux-gnu --sysconfdir=/etc --localstatedir=/var/lib --with-default-user=daemon --with-default-group=daemon \
    && make install-strip \
    && apt-get purge -y --autoremove \
       file \
       gcc \
       libc6-dev \
       libfuse3-dev \
       libpcap0.8-dev \
       make \
       pkgconf \
       zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && mv /etc/mfs /etc/mfs.default \
    && chmod 640 /var/lib/mfs/metadata.mfs.empty \
    && mv /var/lib/mfs /var/lib/mfs.default \
    && sed -i -e 's/^#user_allow_other/user_allow_other/' /etc/fuse.conf

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
