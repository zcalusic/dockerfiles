FROM zcalusic/debian-trixie

ENV OBSERVIUM_HOME=/opt/observium

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       fping \
       logrotate \
       mtr-tiny \
       nginx \
       php \
       php-pear \
       php8.4-curl \
       php8.4-fpm \
       php8.4-gd \
       php8.4-mysql \
       python-is-python3 \
       python3-pymysql \
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
