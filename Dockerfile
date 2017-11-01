FROM debian:jessie
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Debian 8 Jessie" \
      org.label-schema.description="Debian 8 Jessie Docker base image" \
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

COPY stretch.list /etc/apt/sources.list.d/stretch.list
COPY stretch-lower-prio /etc/apt/preferences.d/stretch-lower-prio

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    dumb-init \
    gosu \
    jq \
    less \
    net-tools \
    telnet \
    vim-tiny \
    wget \
    xmlstarlet \
    && rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/stretch.list /etc/apt/preferences.d/stretch-lower-prio
