FROM zcalusic/debian-bullseye as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG S3FS_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       automake \
       g++ \
       git \
       libcurl4-openssl-dev \
       libfuse-dev \
       libssl-dev \
       libxml2-dev \
       make \
       pkg-config \
    && MAKEFLAGS="-j $(nproc)" \
    && export MAKEFLAGS \
    && cd /usr/src \
    && git clone --branch "$S3FS_VERSION" --depth 1 https://github.com/s3fs-fuse/s3fs-fuse \
    && cd s3fs-fuse \
    && ./autogen.sh \
    && ./configure --prefix=/usr \
    && make install-strip \
    && gzip -9 /usr/share/man/man1/s3fs.1

FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       fuse \
       libcurl4 \
       man \
       mime-support \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/bin/s3fs /usr/bin/s3fs
COPY --from=builder /usr/share/man/man1/s3fs.1.gz /usr/share/man/man1/s3fs.1.gz
