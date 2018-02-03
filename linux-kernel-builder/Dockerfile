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

COPY sid.list /etc/apt/sources.list.d/sid.list
COPY sid.pref /etc/apt/preferences.d/sid.pref

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       bc \
       dpkg-dev \
       fakeroot \
       libc6-dev \
       libelf-dev \
    && apt-get install -y --no-install-recommends -t sid \
       gcc \
    && rm -rf /var/lib/apt/lists/*

COPY build.sh /build.sh
COPY config /tmp/config
COPY builddeb /tmp/builddeb
