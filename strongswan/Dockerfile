FROM zcalusic/debian-trixie

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       iptables \
       kmod \
       strongswan \
    && rm -rf /var/lib/apt/lists/*

CMD [ "ipsec", "start", "--nofork" ]
