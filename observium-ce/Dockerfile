FROM zcalusic/debian-buster
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ENV OBSERVIUM_HOME /opt/observium

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       fping \
       logrotate \
       mtr-tiny \
       nginx-light \
       php \
       php-pear \
       php7.3-fpm \
       php7.3-gd \
       php7.3-mysql \
       python-mysqldb \
       rrdtool \
       snmp \
       snmp-mibs-downloader \
       whois \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p "$OBSERVIUM_HOME" \
    && wget --dot-style=mega -O- "https://www.observium.org/observium-community-latest.tar.gz" | tar xzo --strip-components=1 -C "$OBSERVIUM_HOME" \
    && sed -i -e "s/'samesite' => 'Strict'/'samesite' => 'Lax'/" $OBSERVIUM_HOME/html/includes/authenticate.inc.php

COPY etc /etc
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "dumb-init" ]

CMD [ "/entrypoint.sh" ]
