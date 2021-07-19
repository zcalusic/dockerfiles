FROM zcalusic/debian-buster
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

COPY powerdns-archive.gpg /etc/apt/trusted.gpg.d/powerdns-archive.gpg
COPY pdns.list /etc/apt/sources.list.d/pdns.list
COPY pdns.pref /etc/apt/preferences.d/pdns.pref

RUN apt-get update \
    && apt-get install -y --no-install-recommends pdns-recursor \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/pdns-recursor \
    && sed -i -e 's/^local-address=127.0.0.1/local-address=0.0.0.0/' /etc/powerdns/recursor.conf

STOPSIGNAL SIGKILL

EXPOSE 53 53/udp

CMD [ "pdns_recursor" ]
