FROM zcalusic/debian-buster as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG DYNOMITE_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       automake \
       gcc \
       git \
       libc6-dev \
       libssl-dev \
       libtool \
       make \
    && MAKEFLAGS="-j $(nproc)" \
    && export MAKEFLAGS \
    && cd /usr/src \
    && git clone --branch "$DYNOMITE_VERSION" --depth 1 https://github.com/Netflix/dynomite \
    && cd dynomite \
    && autoreconf -fvi \
    && ./configure --prefix=/usr \
    && make install-strip

FROM zcalusic/debian-buster
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN apt-get update \
    && apt-get install -y --no-install-recommends binutils \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /conf

COPY --from=builder /usr/sbin/dynomite /usr/sbin/dynomite
COPY --from=builder /usr/sbin/dynomite-test /usr/sbin/dynomite-test
COPY --from=builder /usr/bin/dynomite-hash-tool /usr/bin/dynomite-hash-tool
COPY --from=builder /usr/src/dynomite/conf /conf

COPY dynomite.yml /conf/dynomite.yml

STOPSIGNAL SIGKILL

EXPOSE 8101 8102 22222

CMD [ "dynomite" ]
