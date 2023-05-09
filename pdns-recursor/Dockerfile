FROM zcalusic/debian-bookworm
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN apt-get update \
    && apt-get install -y --no-install-recommends pdns-recursor \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/pdns-recursor

COPY local.conf /etc/powerdns/recursor.d/local.conf

STOPSIGNAL SIGKILL

EXPOSE 53 53/udp

CMD [ "pdns_recursor" ]
