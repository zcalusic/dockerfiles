FROM debian:stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Debian 9 Stretch" \
      org.label-schema.description="Debian 9 Stretch Docker base image" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-transport-https \
       apt-utils \
       ca-certificates \
       dnsutils \
       dirmngr \
       dumb-init \
       gnupg \
       gosu \
       jq \
       less \
       net-tools \
       netcat-openbsd \
       procps \
       telnet \
       vim-tiny \
       wget \
       xmlstarlet \
    && rm -rf /var/lib/apt/lists/*

COPY sources.list /etc/apt/sources.list
