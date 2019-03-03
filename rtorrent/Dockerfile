FROM zcalusic/debian-buster as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       automake \
       build-essential \
       geoipupdate \
       git \
       libcurl4-gnutls-dev \
       libncurses-dev \
       libssl-dev \
       libtool \
       libxmlrpc-core-c3-dev \
       pkg-config \
       zlib1g-dev \
    && cd /usr/src \
    && git clone --depth 1 https://github.com/rakshasa/libtorrent \
    && cd /usr/src/libtorrent \
    && ./autogen.sh \
    && ./configure --prefix=/usr --libdir=/usr/lib/x86_64-linux-gnu \
    && make -j $(nproc) install-strip \
    && cd /usr/src \
    && git clone --depth 1 https://github.com/rakshasa/rtorrent \
    && cd /usr/src/rtorrent \
    && ./autogen.sh \
    && ./configure --prefix=/usr --with-xmlrpc-c \
    && make -j $(nproc) install-strip \
    && mkdir -p /opt/rtorrent \
    && cd /opt/rtorrent \
    && git clone --depth 1 https://github.com/Novik/ruTorrent . \
    && git clone --depth 1 https://github.com/Micdu70/geoip2-rutorrent.git plugins/geoip2 \
    && geoipupdate -d /opt/rtorrent/plugins/geoip2/database -f /usr/share/doc/geoipupdate/examples/GeoIP.conf.default \
    && rm -rf .git* conf/.htaccess htaccess-example plugins/geoip plugins/geoip2/.git plugins/httprpc plugins/rpc share \
    && find . -type f -name \*.php -exec sed -i -e 's/0777/0755/' {} \; \
    && sed -i -e 's/$saveUploadedTorrents = true;/$saveUploadedTorrents = false;/' \
              -e "s/php.*=> '',\t\t/php\" => '\/usr\/bin\/php',/" \
              -e "s/curl.*=> '',\t\t/curl\" => '\/usr\/bin\/curl',/" \
              -e "s/gzip.*=> '',\t/gzip\" => '\/bin\/gzip',/" \
              -e "s/id.*=> '',\t/id\" => '\/usr\/bin\/id',/" \
              -e "s/stat.*=> '',\t\t/stat\" => '\/usr\/bin\/stat',/" conf/config.php

FROM zcalusic/debian-buster
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="rTorrent in Docker" \
      org.label-schema.description="Run rTorrent BitTorrent client in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       curl \
       ffmpeg \
       libxmlrpc-core-c3 \
       mediainfo \
       nginx-light \
       php \
       php7.3-curl \
       php7.3-fpm \
       sox \
       unrar \
       unzip \
    && rm -rf /var/lib/apt/lists/* /tmp/*

RUN sed -i -e "s/^user = www-data/user = rtorrent/" \
           -e "s/^group = www-data/group = rtorrent/" \
           -e "s/^listen.owner = www-data/listen.owner = rtorrent/" \
           -e "s/^listen.group = www-data/listen.group = rtorrent/" /etc/php/7.3/fpm/pool.d/www.conf \
    && sed -i -e "s/^user www-data;/user rtorrent;/" /etc/nginx/nginx.conf

COPY --from=builder /usr/lib/x86_64-linux-gnu/libtorrent.so.20.0.0 /usr/lib/x86_64-linux-gnu/

RUN ldconfig

COPY --from=builder /usr/bin/rtorrent /usr/bin/rtorrent
COPY --from=builder /opt/rtorrent /opt/rtorrent

COPY etc /etc
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "dumb-init" ]

CMD [ "/entrypoint.sh" ]
