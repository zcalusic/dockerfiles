FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Transmission in Docker" \
      org.label-schema.description="Run Transmission BitTorrent client in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       transmission-cli \
       transmission-daemon \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 9091 51413 51413/udp

CMD [ "transmission-daemon", "-f", "-g", "/config", "-w", "/data", "--no-portmap", "--log-info" ]
