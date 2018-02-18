FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Observium Community Edition in Docker" \
      org.label-schema.description="Run Observium Community Edition in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

ENV OBSERVIUM_HOME /opt/observium

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       fping \
       logrotate \
       mtr-tiny \
       nginx-light \
       php \
       php-pear \
       php7.0-fpm \
       php7.0-gd \
       php7.0-mcrypt \
       php7.0-mysql \
       python-mysqldb \
       rrdtool \
       snmp \
       snmp-mibs-downloader \
       whois \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p "$OBSERVIUM_HOME" \
    && wget --dot-style=mega -O- "https://www.observium.org/observium-community-latest.tar.gz" | tar xzo --strip-components=1 -C "$OBSERVIUM_HOME"

COPY etc /etc
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "dumb-init" ]

CMD [ "/entrypoint.sh" ]
