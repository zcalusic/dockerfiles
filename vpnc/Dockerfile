FROM zcalusic/debian-trixie

RUN apt-get update \
    && apt-get install -y --no-install-recommends vpnc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/vpnc

CMD [ "vpnc" ]
