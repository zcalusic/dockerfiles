FROM debian:bookworm
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN sed -i -e 's/^Components: main$/Components: main contrib non-free non-free-firmware/g' /etc/apt/sources.list.d/debian.sources \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       ca-certificates \
       dnsutils \
       dumb-init \
       gosu \
       iproute2 \
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
