FROM zcalusic/debian-buster
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="qBittorrent in Docker" \
      org.label-schema.description="Run qBittorrent BitTorrent client in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       qbittorrent-nox \
    && rm -rf /var/lib/apt/lists/*

COPY qBittorrent.conf /etc/qBittorrent.conf

EXPOSE 8080 8999

COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT [ "dumb-init" ]

CMD [ "/entrypoint.sh" ]
