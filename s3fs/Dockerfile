FROM zcalusic/debian-stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ENV S3FS_VERSION 1.84

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       automake \
       g++ \
       git \
       libcurl4-openssl-dev \
       libfuse-dev \
       libssl1.0-dev \
       libxml2-dev \
       make \
       pkg-config \
    && cd /usr/src \
    && git clone https://github.com/s3fs-fuse/s3fs-fuse \
    && cd s3fs-fuse \
    && git checkout v${S3FS_VERSION} \
    && ./autogen.sh \
    && ./configure --prefix=/usr \
    && make -j "$(nproc)" install-strip \
    && gzip -9 /usr/share/man/man1/s3fs.1

FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="s3fs in Docker" \
      org.label-schema.description="Run s3fs FUSE-based file system backed by Amazon S3 in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       fuse \
       libcurl3 \
       man \
       mime-support \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/bin/s3fs /usr/bin/s3fs
COPY --from=builder /usr/share/man/man1/s3fs.1.gz /usr/share/man/man1/s3fs.1.gz
