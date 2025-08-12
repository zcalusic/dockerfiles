FROM zcalusic/debian-trixie

RUN apt-get update \
    && apt-get install -y --no-install-recommends pdns-recursor \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/pdns-recursor

COPY local.yml /etc/powerdns/recursor.d/local.yml

STOPSIGNAL SIGKILL

EXPOSE 53 53/udp

CMD [ "pdns_recursor" ]
